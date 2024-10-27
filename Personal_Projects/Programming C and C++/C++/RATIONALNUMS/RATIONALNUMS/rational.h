/******************************************************************************
* Class and Function Header-rational.h										  *
******************************************************************************/

#ifndef RATIONAL_H
#define RATIONAL_H

#include <cmath>
#include <cstdlib>
#include <iostream>


class Rational
{
private:
	int num, denom, n=0, d=0, menusel=0;

public:
	Rational(void);
	int set(void);
	void check(void);
	void display(void);
	void add(int n, int d);
	void sub(int n, int d);
	void mul(int n, int d);
	void div(int n, int d);
	int menu(void);
};

#endif