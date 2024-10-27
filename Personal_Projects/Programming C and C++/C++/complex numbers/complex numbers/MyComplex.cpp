#include "MyComplex.h"

using namespace std;

int f = 0;
int* flag=&f;


/*
overloading 
i need my overloaded adder function that just reads date you enter 
and then my arithmetic operator overloaded functions
*/



void MyComplex::printMyComplex(void)
{
		cout << rational << ' ' << '+' << ' ' << imaginary << "i" << endl;
} 


float MyComplex::getrational()
{
	return rational;
}

float MyComplex::getimaginary()
{
	return imaginary;
}

MyComplex MyComplex::operator+ (const MyComplex& prod)
{
	MyComplex n1;
	n1.rational = rational + prod.rational;
	n1.imaginary = imaginary + prod.imaginary;

	return n1;
}
MyComplex MyComplex::operator - (const MyComplex& prod)
{
	MyComplex n1;
	n1.rational = rational - prod.rational;

	n1.imaginary = imaginary - prod.imaginary;

	return n1;
}

MyComplex MyComplex::operator * (const MyComplex& prod)
{
	MyComplex n1;
	n1.rational = (rational * prod.rational) - (imaginary * prod.imaginary);
	n1.imaginary = (imaginary * prod.rational)+(rational*prod.imaginary);

	return n1;
}
