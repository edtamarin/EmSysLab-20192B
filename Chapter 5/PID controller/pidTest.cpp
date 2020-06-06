#include <iostream>
#include <cmath>
#include <vector>
#include "PID.h"

using namespace std;

double kP = 0.6; // 1.6
double kI = 0.1; // 10.5
double kD = 0.005; // 0.05
double dt = 0.033;

int main(){
    PIDController pidCont = PIDController(dt,kP,kI,kD,0,0);
    vector<double> testData;
    cout << "PID test start with data:" << endl;
    for (int i=1; i<=5; i++) testData.push_back(1*i);
    for (int i=1; i<=20; i++) testData.push_back(5);
    for (int i=5; i>=1; i--) testData.push_back(1*i);
    for (int i=1; i<=10; i++) testData.push_back(0);
    for (auto i=testData.begin(); i != testData.end(); ++i)
        cout << *i << " ";
    cout << "\n";
    double val = 0;
    cout.precision(3);
    for (auto i=testData.begin(); i != testData.end(); ++i){
        double setpoint = *i;
        double pid = pidCont.calculate(setpoint, val);
        cout << "IN: " << setpoint << " PID: " << pid << " VAL: " << val << endl;
        val += pid;
    }
}