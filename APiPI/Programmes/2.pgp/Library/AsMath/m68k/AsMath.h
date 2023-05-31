/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef ASMATH_H_
#define ASMATH_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plc.h>
#include <bur/plctypes.h>



/* Constants */
_WEAK const float am1_PI = 0.318309886183791;
_WEAK const float am2_PI = 0.636619772367581;
_WEAK const float am2_SQRTPI = 1.12837916709551;
_WEAK const float am3PI_4 = 2.35619449019234;
_WEAK const float amE = 2.71828182845905;
_WEAK const float amINVLN2 = 1.44269504088896;
_WEAK const float amIVLN10 = 0.434294481903252;
_WEAK const float amLN10 = 2.30258509299405;
_WEAK const float amLN2 = 0.693147180559945;
_WEAK const float amLN2HI = 0.693147180369124;
_WEAK const float amLN2LO = 1.90821492927059e-010;
_WEAK const float amLOG10E = 0.434294481903252;
_WEAK const float amLOG2E = 1.44269504088896;
_WEAK const float amLOG2_E = 0.693147180559945;
_WEAK const float amPI = 3.14159265358979;
_WEAK const float amPI_2 = 1.5707963267949;
_WEAK const float amPI_4 = 0.785398163397448;
_WEAK const float amSQRT1_2 = 0.707106781186548;
_WEAK const float amSQRT2 = 1.4142135623731;
_WEAK const float amSQRT3 = 1.73205080756888;
_WEAK const float amSQRTPI = 1.77245385090552;
_WEAK const float amTWOPI = 6.28318530717959;


/* Datatypes */


/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
float tanh(float x);
float sinh(float x);
float pow(float x, float y);
float modf(float x, unsigned long plp);
float ldexp(float x, signed long exp_val);
float frexp(float x, unsigned long pExp);
float fmod(float x, float y);
float floor(float x);
float cosh(float x);
float ceil(float x);
float atan2(float y, float x);



#endif /* ASMATH_H_ */

