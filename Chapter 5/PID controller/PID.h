/**
 * PID controller class
 * Author: Egor Tamarin, 2019
 */

class PIDController
{
    private:
        double _dt;
        double _P;
        double _I;
        double _D;
        double _maxOut;
        double _minOut;
        double _prevError;
        double _integral;
    public:
        PIDController(double dt, double P, double I, double D, double max, double min);
        double calculate(double setpoint, double feedback);
};