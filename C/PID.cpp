/**
 * PID controller implementation
 * Author: Egor Tamarin, 2019
 */

#include <iostream>
#include "PID.h"

PIDController::PIDController(double dt, double P, double I, double D, double max, double min){
    _dt = dt;
    _P = P;
    _I = I;
    _D = D;
    _maxOut = max;
    _minOut = min;
    _prevError = 0;
    _integral = 0;
}

double PIDController::calculate(double setpoint, double feedback){
    double error = setpoint - feedback;
    // calculate P output
    double newP = _P * error;
    // calculate I output
    _integral += error * _dt;
    double newI = _I * _integral;
    // calculate D output
    double dv = (error-_prevError)/_dt;
    double newD = _D * dv;
    // total output is the sum of all three
    double pidOut = newP + newI + newD;
    // signal limiter
    if ((pidOut > _maxOut) && (_maxOut != 0)){
        pidOut = _maxOut;
    }else if ((pidOut < _minOut) && (_minOut != 0)){
        pidOut = _minOut;
    }
    _prevError = error;
    return pidOut;
}
