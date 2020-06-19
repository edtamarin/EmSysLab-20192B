#include <iostream>
#include <cmath>
#include <vector>
#include "PID.h"
#include "Motor.h"

using namespace std;

double kP = 3; // 1.6
double kI = 0.2; // 10.5
double kD = 0.025; // 0.05
double dt = 0.033;

int main(){
    PIDController pidCont = PIDController(dt,kP,kI,kD,0,0);
    Motor mot = Motor(0.01,0.1,0.1,2,0.5,0.1);
    vector<double> testData;
    cout << "PID test start with data:" << endl;
    for (int i=1; i<=5; i++) testData.push_back(1*i);
    for (int i=1; i<=30; i++) testData.push_back(5);
    for (int i=5; i>=1; i--) testData.push_back(1*i);
    for (int i=1; i<=10; i++) testData.push_back(0);
    for (auto i=testData.begin(); i != testData.end(); ++i)
        cout << *i << " ";
    cout << "\n";
    double val = 0;
    float speed = 0;
    cout.precision(3);
    for (auto i=testData.begin(); i != testData.end(); ++i){
        double setpoint = *i;
        double pid = pidCont.calculate(setpoint, (double)speed);
        val += pid;
        speed = mot.run((float)val/0.476);
        cout << "IN: " << setpoint << " PID: " << pid << " SPD:" << speed << endl;
    }
}