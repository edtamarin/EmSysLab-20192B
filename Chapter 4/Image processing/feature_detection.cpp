#include <stdio.h>
#include <string>
#include <cmath>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

/**
 * Get the center of a contour
 */
Point getCenterPoint(cv::Mat& im, std::vector<cv::Point>& contour){
    Rect r = boundingRect(contour);
    Point pt(r.x + ((r.width) / 2), r.y + ((r.height) / 2));
    // draw a small circle at the center of the contour
    circle(im,pt,3,Scalar(0,0,255),-1);
    return pt;
}

int main(int argc, char *argv[]){
    if (argc != 5){
        printf("Usage: <device> <width> <height> <number of frames>");
    }else{
        string device = argv[1];
        string width = argv[2];
        string height = argv[3];
        string numFrames = argv[4];
        int blocksize = stoi(width)*stoi(height)*3;
        string gst_pipe = "v4l2src device="+device+" blocksize="+to_string(blocksize)+
            " num_buffers="+numFrames+
            " ! image/jpeg,framerate=30/1,width="+width+",height="+height+
            " ! appsink";
        cout << "Initialing GStreamer with pipeline:" << endl;
        cout << gst_pipe << endl;
        VideoCapture gst_cap(0);
        if (!gst_cap.isOpened()){
            cout << "ERROR: Can't create capture!" << endl;
            return -1;
        }
        cout << "Capture created!" << endl;

        Mat frame;
        int framenum = 1;

        // run for a determined number of frames
        while (framenum < stoi(numFrames)){
            gst_cap >> frame;
            if (frame.empty()) break;
            // grayscale image
            //Mat grayFrame;
            //cvtColor(frame,grayFrame, COLOR_RGB2GRAY );
            // use Canny edge detection to detect contours
            Mat cannyFrame;
            Canny(frame,cannyFrame,0,50,5);
            vector<vector<Point>> contours;
            vector<Point> approx;
            Mat dst = frame.clone();
            findContours(cannyFrame.clone(), contours, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE);
            //cout << "Detected contours: " << contours.size() << endl;
            for (int i = 0; i < contours.size(); i++){
                // approximate contours and discard small/convex
                approxPolyDP(Mat(contours[i]), approx, arcLength(Mat(contours[i]), true)*0.02, true);
                if (std::fabs(cv::contourArea(contours[i])) < 100 || !cv::isContourConvex(approx))
                    continue;
                int vertices = approx.size();
                // detect squares
                if (vertices == 4){
                    // mark the coordinates on a frame and write an image
                    Point detected = getCenterPoint(dst, contours[i]);
                    //imwrite("det_"+to_string(detected.x)+"_"+to_string(detected.y)+".jpg",dst);
                    cout << "Frame " << framenum << ": Detected shape at (" << detected.x << " " << detected.x << ")" << endl;
                }
            }
            framenum++;
        }
        return 0;
    }
}