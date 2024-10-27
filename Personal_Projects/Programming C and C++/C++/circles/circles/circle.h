#pragma once
/* circle.h ******************************************************************/
#include "point.h"

class Circle : public Point
{
protected:
	float r, a;
public:
	Circle(){};
	Circle(float xc, float yc, float rad);
	friend ostream& operator<<(ostream& output, const Circle& c);
};