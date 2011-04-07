// Structs to hold points in 5D space.

extern "C" {
  #include <toolhead.h>
  #include <hardware/arduino_toolhead.h>
}

#include "vectors.h"
#include <math.h>
#include "firmware.h"

inline FloatPoint operator+(const FloatPoint& a, const FloatPoint& b)
{
  FloatPoint result;
  result.x = a.x + b.x;
  result.y = a.y + b.y;
  result.z = a.z + b.z;
  result.e = a.e + b.e;
  result.f = a.f + b.f;
  return result;
}  

inline FloatPoint operator-(const FloatPoint& a, const FloatPoint& b)
{
  FloatPoint result;
  result.x = a.x - b.x;
  result.y = a.y - b.y;
  result.z = a.z - b.z;
  result.e = a.e - b.e;
  result.f = a.f - b.f;
  return result;
} 


// NB - the next gives neither the scalar nor the vector product

inline FloatPoint operator*(const FloatPoint& a, const FloatPoint& b)
{
  FloatPoint result;
  result.x = a.x * b.x;
  result.y = a.y * b.y;
  result.z = a.z * b.z;
  result.e = a.e * b.e;
  result.f = a.f * b.f;
  return result;
} 

// Can't use fabs for this as it's defined somewhere in a #define

inline FloatPoint fabsv(const FloatPoint& a)
{
  FloatPoint result;
  result.x = fabs(a.x);
  result.y = fabs(a.y);
  result.z = fabs(a.z);
  result.e = fabs(a.e);
  result.f = fabs(a.f);
  return result;
} 


inline LongPoint operator+(const LongPoint& a, const LongPoint& b)
{
  LongPoint result;
  result.x = a.x + b.x;
  result.y = a.y + b.y;
  result.z = a.z + b.z;
  result.e = a.e + b.e;
  result.f = a.f + b.f;
  return result;
}  

inline LongPoint operator-(const LongPoint& a, const LongPoint& b)
{
  LongPoint result;
  result.x = a.x - b.x;
  result.y = a.y - b.y;
  result.z = a.z - b.z;
  result.e = a.e - b.e;
  result.f = a.f - b.f;
  return result;
} 


inline LongPoint absv(const LongPoint& a)
{
  LongPoint result;
  result.x = abs(a.x);
  result.y = abs(a.y);
  result.z = abs(a.z);
  result.e = abs(a.e);
  result.f = abs(a.f);
  return result;
} 


inline LongPoint roundv(const FloatPoint& a)
{
  LongPoint result;
  result.x = round(a.x);
  result.y = round(a.y);
  result.z = round(a.z);
  result.e = round(a.e);
  result.f = round(a.f);
  return result;
} 

inline LongPoint to_steps(const FloatPoint& units, const FloatPoint& position)
{
        return roundv(units*position);
}

