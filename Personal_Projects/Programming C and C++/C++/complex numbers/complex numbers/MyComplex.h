#pragma once

#include <iostream>
#include <cstdlib>

using namespace std;

class MyComplex
{
	
public:
	float rational, imaginary;
	MyComplex(void) {};
	MyComplex(float r, float i) : rational(r), imaginary(i) {}
	void printMyComplex(void);
	float getrational(void);
	float getimaginary();
	MyComplex operator + (const MyComplex &prod);
	MyComplex operator - (const MyComplex& prod);
	MyComplex operator * (const MyComplex& prod);
//	MyComplex operator = (const MyComplex& prod);
};