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
#include "Motor.h"

using namespace std;
using namespace cv;

// PID coefficients, tuned manually
double kP = 3;
double kI = 0.2; 
double kD = 0.025; 
double dt = 0.033;
double pidLimitMin = -5.0;
double pidLimitMax = 5.0;

// Motor model parameters
float J = 0.01;
float b = 0.1;
float K = 0.1;
float R = 2;
float L = 0.5;
float T = 0.1;

// PID controllers for X and Y movement
// Motors are assumed to be similar
PIDController pidHoriz = PIDController(dt,kP,kI,kD,pidLimitMax,pidLimitMin);
PIDController pidVert = PIDController(dt,kP,kI,kD,pidLimitMax,pidLimitMin);

//Motors for pan and tilt
Motor horizMotor = Motor(J,b,K,R,L,T);
Motor vertMotor = Motor(J,b,K,R,L,T);

/**
 * Get the center of a contour
 */
Point getCenterPoint(cv::Mat& im, std::vector<cv::Point>& contour, int type){
    Rect r = boundingRect(contour);
    Point pt(r.x + ((r.width) / 2), r.y + ((r.height) / 2));
    // draw a small circle at the center of the contour
    if (type == 0){ // good shape
        circle(im,pt,3,CV_RGB(0,255,0),-1);
    }else if (type==1){ // bad shape
        circle(im,pt,3,CV_RGB(255,0,0),-1);
    }
    
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
    Point2f centroid = Point2f(centX,centY);
    // draw the point on the image and return
    circle(im,centroid,3,CV_RGB(0,0,255),-1);
    return centroid;
}

/**
 * Calculate how the camera should move
 * */
Point2f moveCamera(Mat im, Point2f setpoint, Point2f value){
    // initial speeds
    float speedX = (setpoint.x-value.x)/0.5;
    float speedY = (setpoint.y-value.y)/0.5;
    float xMove = pidHoriz.calculate(speedX,horizMotor.vel);
    float yMove = pidVert.calculate(speedY,vertMotor.vel);
    // simulate camera movement
    horizMotor.vel = horizMotor.run(xMove/0.476);
    vertMotor.vel = vertMotor.run(yMove/0.476);
    cout << "=== SPEED (" << horizMotor.vel << " " << vertMotor.vel << ") ===" << endl;
    Point2f newTarget = Point2f(value.x+horizMotor.vel,value.y+vertMotor.vel);
    cout << "=== CAM TARGET (" << newTarget.x << " " << newTarget.y << ") ===" << endl;
    return newTarget;
}

int main(int argc, char *argv[]){
    if (argc != 6){
        printf("Usage: <capture device> <frame width> <frame height> <number of frames> <output video FPS>\n");
    }else{
        // user input
        cout.precision(3);
        string device = argv[1];
        string width = argv[2];
        string height = argv[3];
        string numFrames = argv[4];
        int fps = stoi(argv[5]);
        cout << "Initializing capture with parameters:" << endl;
        cout << "Device: " << device << ", frame size: " << width << "x" << height << endl;
        VideoCapture gst_cap(device);
        VideoWriter video("demo.avi",CV_FOURCC('M','J','P','G'),fps,Size(stoi(width),stoi(height)));
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
        Point2f cameraTarget = Point2f(stoi(width)/2,stoi(height)/2);

        // run for a determined number of frames
        while (framenum < stoi(numFrames)){
            gst_cap >> frame;
            if (frame.empty()) break;
            // grayscale image
            Mat grayFrame;
            cvtColor(frame,grayFrame, COLOR_RGB2GRAY );
            // thresholding
            Mat threshFrame;
            threshold(grayFrame,threshFrame,100,255,cv::THRESH_BINARY_INV);
            // use Canny edge detection to detect contours
            Mat cannyFrame;
            Canny(threshFrame,cannyFrame,100,200);
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
                // detect shapes based on the amount of vertices
                if (vertices == 4){
                    // mark the coordinates on a frame and write an image
                    Point detected = getCenterPoint(dst, contours[i],1);
                    cout << "      " << framenum << ": Detected square shape at (" << detected.x << " " << detected.y << ")" << endl;
                    featureCoords.push_back(detected);
                }else if (vertices == 3){
                    Point detected = getCenterPoint(dst, contours[i],0);
                    cout << "      " << framenum << ": Detected triangle shape at (" << detected.x << " " << detected.y << ")" << endl;
                }
            }
            // find centroid
            Point2f featureCenter;
            if (featureCoords.size() > 0){
                featureCenter = getCentroid(dst,featureCoords);
                cout << "      " << framenum << ": Centroid at (" << featureCenter.x << " " << featureCenter.y << ")" << endl;
                cout << "      " << framenum << ": Old trgt at (" << cameraTarget.x << " " << cameraTarget.y << ")" << endl;
            }else{
                cout << "=== NO BAD PARTS FOUND ===" << endl;
                // reset cam to center
                featureCenter = Point2f(stoi(width)/2,stoi(height)/2);
            }
            // move the camera
            cameraTarget = moveCamera(dst, featureCenter,cameraTarget);
            // draw a line along the movement
            arrowedLine(dst,cameraTarget,featureCenter,CV_RGB(255,255,0),1.5);
            // indicate the target (where the camera is pointing at)
            circle(dst,cameraTarget,5,CV_RGB(255,0,0),1);
            // write frame
            video.write(dst);
            framenum++;
        }
        gst_cap.release();
        video.release();
        return 0;
    }
}