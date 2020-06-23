/**
 * Motor class
 * Author: Egor Tamarin
 * June 2020
 */

#include <functional>

class Motor{
    private:
        float _J;
        float _b;
        float _K;
        float _R;
        float _L;
        float _T;
        float _Ke;
        float _I;
        float _prevI;
        float _S;
        float _prevS;
        // calculate current
        float current(float vIn, float iOut);
        // calculate speed
        float speed(float iIn, float sOut);
        // Euler method integration
        float eulerI(float buffer, float input, float current);
        float eulerS(float buffer, float input, float speed);
    public:
        float vel;
        Motor(float J, float b, float K, float R, float L, float T);
        float run(float V); // calculate speed based on voltage
};