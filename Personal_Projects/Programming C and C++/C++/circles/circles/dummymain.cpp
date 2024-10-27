#include <iostream>
#include "point.h"
#include "circle.h"
#include "cylinder.h"
using namespace std;
int main()
{
	Point p(4, 4); // x coordinate, y coordinate
	Circle c(5, 5, 5); // x, y, radius
	Cylinder y(6, 6, 6, 6); // x, y, r, height
	cout << p << endl << endl;
	cout << c << " " << endl << (Point)c << endl << endl;
	cout << y << " " << endl << (Circle)y << " " << endl << (Point)y
		<< endl << endl;
	return 0;
}
/*
produces this output:
Point at(4, 4)
Circle with center = (5, 5); Radius = 5; Area = 78.5397
Point at(5, 5)
Cylinder with center = (6, 6); Radius = 6; Height = 6; Volume = 678.583
Circle with center = (6, 6); Radius = 6; Area = 113.097
Point at(6, 6)
*/