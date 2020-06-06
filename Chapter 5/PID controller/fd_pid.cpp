/**
 * Detect multiple features in a frame and
 * simulate the motor movement to the equidistant point
 * Author: Egor Tamarin
 * June 2020
 */

#include <stdio.h>
#include <string>
#include <cmath>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>
#include "PID.h"

using namespace std;
using namespace cv;

// PID coefficients, tuned manually
double kP = 0.6; 
double kI = 0.1; 
double kD = 0.005;
double dt = 0.033; // 1 frame time
double pidLimitMin = 0;
double pidLimitMax = 0;

// PID controllers for X and Y movement
// Motors are assumed to be similar
PIDController pidHoriz = PIDController(dt,kP,kI,kD,pidLimitMax,pidLimitMin);
PIDController pidVert = PIDController(dt,kP,kI,kD,pidLimitMax,pidLimitMin);

/**
 * Get the center of a contour
 */
Point getCenterPoint(cv::Mat& im, std::vector<cv::Point>& contour){
    Rect r = boundingRect(contour);
    Point pt(r.x + ((r.width) / 2), r.y + ((r.height) / 2));
    // draw a small circle at the center of the contour
    circle(im,pt,3,CV_RGB(0,0,255),-1);
    return pt;
}

/**
 * Get centroid of all features
 */
Point getCentroid(Mat im, vector<Point> features){
    int numFeatures = features.size();
    int sumX = 0;
    int sumY = 0;
    // sum all coordinates
    for (int i=0;i<numFeatures;i++){
        sumX += features[i].x;
        sumY += features[i].y;
    }
    // mean of coordinates is centroid
    int centX = round(sumX/numFeatures);
    int centY = round(sumY/numFeatures);
    Point centroid = Point(centX,centY);
    // draw the point on the image and return
    circle(im,centroid,3,CV_RGB(0,0,0),-1);
    return centroid;
}

/**
 * Calculate how the camera should move
 * */
Point moveCamera(Mat im, Point setpoint, Point value){
    cv::String coords = "";
    double xMove = pidHoriz.calculate(setpoint.x,value.x);
    double yMove = pidVert.calculate(setpoint.y,value.y);
    cout << "=== PID OFFSET (" << round(xMove) << " " << round(yMove) << ") ===" << endl;
    // simulate camera movement
    Point newTarget = Point(value.x+round(xMove),value.y+round(yMove));
    cout << "=== CAM TARGET (" << newTarget.x << " " << newTarget.y << ") ===" << endl;
    // print the coordinates on the frame and write it
    coords = "(" + to_string(setpoint.x) + " " + to_string(setpoint.y) + 
        ") (" + to_string(newTarget.x) + " " + to_string(newTarget.y) + 
        ") ("+ to_string((int)round(xMove)) + " " + to_string((int)round(yMove)) + ")";
    // put setpoint, target and PID offset on frame
    putText(im,coords,Point(10,50),FONT_HERSHEY_DUPLEX,0.75,CV_RGB(0,0,0),2);
    return newTarget;
}

int main(int argc, char *argv[]){
    if (argc != 5){
        printf("Usage: <device> <width> <height> <number of frames>");
    }else{
        // user input
        string device = argv[1];
        string width = argv[2];
        string height = argv[3];
        string numFrames = argv[4];
        cout << "Initializing capture with parameters:" << endl;
        cout << "Device: " << device << ", frame size: " << width << "x" << height << endl;
        VideoCapture gst_cap(device);
        // set capture properties
        gst_cap.set(CAP_PROP_FRAME_WIDTH,stoi(width));
        gst_cap.set(CAP_PROP_FRAME_HEIGHT,stoi(height));
        if (!gst_cap.isOpened()){
            cout << "ERROR: Can't create capture!" << endl;
            return -1;
        }
        cout << "Capture created!" << endl;

        Mat frame;
        int framenum = 1;
        // camera starts pointed at the center of the frame
        Point cameraTarget = Point(stoi(width)/2,stoi(height)/2);

        // run for a determined number of frames
        while (framenum < stoi(numFrames)){
            gst_cap >> frame;
            if (frame.empty()) break;
            // grayscale image
            Mat grayFrame;
            cvtColor(frame,grayFrame, COLOR_RGB2GRAY );
            // use Canny edge detection to detect contours
            Mat cannyFrame;
            Canny(grayFrame,cannyFrame,100,200);
            //imwrite("can_"+to_string(framenum)+".jpg",cannyFrame);
            vector<vector<Point>> contours;
            vector<Point> approx;
            // clone frame to modify it
            Mat dst = frame.clone();
            // find contrours in an image
            findContours(cannyFrame.clone(), contours, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE);
            cout << "Frame " << framenum << ": Detected contours: " << contours.size() << endl;
            vector<Point> featureCoords;
            // iterate over contours
            for (int i = 0; i < contours.size(); i++){
                // approximate contours and discard small/convex
                approxPolyDP(Mat(contours[i]), approx, arcLength(Mat(contours[i]), true)*0.02, true);
                if (std::fabs(cv::contourArea(contours[i])) < 100 || !cv::isContourConvex(approx))
                    continue;
                int vertices = approx.size();
                Point detected = getCenterPoint(dst, contours[i]);
                // detect shapes based on the amount of vertices
                if (vertices == 4){
                    // mark the coordinates on a frame and write an image
                    cout << "      " << framenum << ": Detected square shape at (" << detected.x << " " << detected.y << ")" << endl;
                    featureCoords.push_back(detected);
                }else if (vertices == 3){
                    cout << "      " << framenum << ": Detected triangle shape at (" << detected.x << " " << detected.y << ")" << endl;
                }
            }
            // find centroid
            Point featureCenter = getCentroid(dst,featureCoords);
            cout << "      " << framenum << ": Centroid at (" << featureCenter.x << " " << featureCenter.y << ")" << endl;
            // move the camera
            cameraTarget = moveCamera(dst, featureCenter,cameraTarget);
            // draw a line along the movement
            arrowedLine(dst,cameraTarget,featureCenter,CV_RGB(255,255,0),1.5);
            // write frame
            imwrite("det_"+to_string(framenum)+".jpg",dst);
            framenum++;
        }
        return 0;
    }
}