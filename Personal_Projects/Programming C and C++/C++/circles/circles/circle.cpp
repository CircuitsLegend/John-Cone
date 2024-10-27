#include "circle.h"
/******************************************************************************
@name Circle
@brief constructor that assigns protected members
@param x and y coordinates and radius
@retval none
******************************************************************************/
Circle::Circle(float xc, float yc, float rad)
{
	//assign coordinates, radius and area
	x = xc;
	y = yc;
	r = rad;
	a = (3.14159 * r * r);
}
/******************************************************************************
@name operator<<
@brief overloads extraction operator
@param ostream by reference and const Circle by reference
@retval ostream by reference
******************************************************************************/
ostream& operator<<(ostream& output, const Circle& c)
{
	//print coordinates at point and radius and area
	output << "Circle with center: (" << c.x << " , " << c.y <<
		") ; Radius: "<<c.r<< " ; Area: "<< c.a;
	return output;
}