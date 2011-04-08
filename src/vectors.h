/*
 * vectors.h
 *
 *  Created on: 2011-04-05
 *      Author: rob
 */

#ifndef VECTORS_H_
#define VECTORS_H_

// Real-world units
struct FloatPoint
{
        float x;   // Coordinate axes
        float y;
        float z;
        float e;   // Extrude length
        float f;   // Feedrate
};

 FloatPoint operator+(const FloatPoint& a, const FloatPoint& b);
 FloatPoint operator-(const FloatPoint& a, const FloatPoint& b);
 FloatPoint operator*(const FloatPoint& a, const FloatPoint& b);
 FloatPoint fabsv(const FloatPoint& a);

// Integer numbers of steps
struct LongPoint
{
        long x;   // Coordinates
        long y;
        long z;
        long e;   // Extrusion
        long f;   // Feedrate
};

 LongPoint operator+(const LongPoint& a, const LongPoint& b);
 LongPoint operator-(const LongPoint& a, const LongPoint& b);
 LongPoint absv(const LongPoint& a);
 LongPoint roundv(const FloatPoint& a);
LongPoint to_steps(const FloatPoint& units, const FloatPoint& position);


#endif /* VECTORS_H_ */
