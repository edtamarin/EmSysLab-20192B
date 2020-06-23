/**
 * Motor implementation
 * Author: Egor Tamarin
 * June 2020
 */

#include "Motor.h"

Motor::Motor(float J, float b, float K, float R, float L, float T){
    _J = J;
    _b = b;
    _K = K;
    _R = R;
    _L = L;
    _T = T;
    _Ke = _I = _S = _prevI = _prevS = vel = 0; // internal variables, 0 initially
}

float Motor::current(float vIn, float iOut){
    return (vIn-(_R*iOut)-_Ke)/_L;
}

float Motor::speed(float iIn, float sOut){
    return (iIn-sOut*_b)/_J;
}

float Motor::eulerI(float buffer, float input, float crnt){
    return buffer + _T*current(input,crnt);
}

float Motor::eulerS(float buffer, float input, float spd){
    return buffer + _T*speed(input,spd);
}

float Motor::run(float V){
    _I = eulerI(_prevI,V,_I);
    _S = eulerS(_prevS,_I*_K,_S);
    _Ke = _S*_K;
    _prevI = _I;
    _prevS = _S;
}