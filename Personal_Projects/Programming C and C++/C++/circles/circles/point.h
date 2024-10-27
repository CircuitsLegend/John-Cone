#pragma once
/* point.h *******************************************************************/
#include <iostream>
#include "shape.h"
using namespace std;

class Point: public Shape
{
protected:
	float x,y;
public:
	Point(){}//default constructor does nothing
	Point(float xc, float yc);
	friend ostream& operator<<(ostream& output, const Point& p);
};