#include "MyComplex.h"

using namespace std;

int main(void) 
{

	MyComplex a(1, 7);
	MyComplex b(1,4);
	MyComplex c;
	c = a * b;
	c.printMyComplex();
	c = a + b;
	c.printMyComplex();
	c = a - b;
	c.printMyComplex();

	return 0;
}