#include "cylinder.h"
/******************************************************************************
@name Cylinder
@brief constructor that assigns protected members
@param x and y coordinates, radius and height
@retval none
******************************************************************************/
Cylinder::Cylinder(float xc, float yc, float rad, float height)
{
	//assign coordinates, radius, area, height and volume
	x = xc;
	y = yc;
	r = rad;
	a = (3.14159*r*r);
	h = height;
	v = a * h;
}
/******************************************************************************
@name operator<<
@brief overloads extraction operator
@param ostream by reference and const Cylinder by reference
@retval ostream by reference
******************************************************************************/
ostream& operator<<(ostream& output, const Cylinder& cy)
{
	//print coordinates at point, radius, height and volume
	output << "Cylinder with center: (" << cy.x << " , " << cy.y <<
		") ; Radius: " << cy.r << " ; Height: " << cy.h<<" ; Volume: "<<cy.v;
	return output;
}