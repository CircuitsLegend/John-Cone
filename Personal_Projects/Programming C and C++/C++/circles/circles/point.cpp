#include "point.h"
/******************************************************************************
@name Point
@brief constructor for a point
@param x and y coordinates
@retval none
******************************************************************************/
Point::Point(float xc, float yc)
{
	x = xc; y = yc; //assign coordinates
}
/******************************************************************************
@name operator<<
@brief overloads extraction operator
@param ostream by reference and const Point by reference
@retval ostream by reference
******************************************************************************/
ostream& operator<<(ostream& output, const Point& p)
{
	//print coordinates at point
	output << "Point at: (" << p.x << " , " << p.y << ")";
	return output;
}