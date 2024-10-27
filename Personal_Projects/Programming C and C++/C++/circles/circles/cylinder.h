#pragma once
/* cylinder.h ****************************************************************/
#include "circle.h"

class Cylinder: public Circle
{
protected:
	float h, v;
public:
	Cylinder(float xc, float yc, float rad, float height);
	friend ostream& operator<<(ostream& output, const Cylinder& cy);
};