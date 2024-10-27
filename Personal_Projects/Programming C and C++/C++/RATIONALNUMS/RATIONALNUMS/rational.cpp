/******************************************************************************
* Class and Function Definitions-rational.cpp								  *
******************************************************************************/

#include <cmath>
#include <cstdlib>
#include <iostream>
#include "rational.h"

using namespace std;

Rational::Rational(void)
{
	cout << "Enter numerator: ";
	cin >> num;
	try
	{
		if (num == 0)
			throw 1;
	}
	catch (int)
	{
		cout << "Error: input cannot equal 0" << endl;
	}
	cout << "Enter denominator: ";
	cin >> denom;
	try
	{
		if (denom == 0)
			throw 1;
	}
	catch (int)
	{
		cout << "Error: input cannot equal 0" << endl;
	}


}

/******************************************************************************
* @name set																	  *
* @brief sets values for num and denom										  *
* @param int numerator														  *
* @param int denomenator													  *
* @retval void																  *
******************************************************************************/

int Rational::set(void)
{
	cout << "Enter numerator: ";
	cin >> n;
	try
	{
		if (n == 0)
			throw 1;
	}
	catch (int)
	{
		cout << "Error: input cannot equal 0" << endl;
		return 0;
	}
	cout << "Enter denominator: ";
	cin >> d;
	try
	{
		if (d == 0)
			throw 1;
	}
	catch (int)
	{
		cout << "Error: invalid input" << endl;
		return 0;
	}
}

/******************************************************************************
* @name check																  *
* @brief checks num and denom for 0 value									  *
* @param int numerator														  *
* @param int denomenator													  *
* @retval void																  *
******************************************************************************/

void Rational::check(void)
{
	int n1, n2, gcf;
	n1 = num;
	n2 = denom;
	while (n1 != n2)
	{
		if (n1 > n2)
		n1 = n1 - n2;
		else if (n2 > n1)
		n2 = n2 - n1;
	}
		num = num / n1;
		denom = denom / n2;
		try 
		{
			if (num == 0 || denom == 0)
				throw 1;
		}
		catch (int)
		{
			cout << "error equivalent to zero";

		}
}

/******************************************************************************
* @name display																  *
* @brief prints intermediate fraction										  *
* @param None																  *
* @retval void																  *
******************************************************************************/

void Rational::display(void)
{
	if(menusel!=0)
	cout << num << "/" << denom << endl;
}

/******************************************************************************
* @name add																	  *
* @brief adds two fractions													  *
* @param int numerator														  *
* @param int denomenator													  *
* @retval void																  *
******************************************************************************/

void Rational::add(int n, int d)
{
	if (denom == d)
		num += n;
	else
	{
		n *= denom;
		denom *= d;
		num *= d;
		d = denom;
		num += n;
	}
}

/******************************************************************************
* @name sub																	  *
* @brief subtracts two fractions											  *
* @param int numerator														  *
* @param int denomenator													  *
* @retval void																  *
******************************************************************************/
void Rational::sub(int n, int d)
{
	if (denom == d)
		num -= n;
	else
	{
		n *= denom;
		denom *= d;
		num *= d;
		d = denom;
		num -= n;
	}
}

/******************************************************************************
* @name mull 																  *
* @brief multiplies two fractions											  *
* @param int numerator														  *
* @param int denomenator													  *
* @retval void																  *
******************************************************************************/

void Rational::mul(int n, int d)
{
	num *= n;
	denom *= d;
}

/******************************************************************************
* @name div																	  *
* @brief divides two fractions												  *
* @param int neumerator														  *
* @param int denomenator													  *
* @retval void																  *
******************************************************************************/

void Rational::div(int n, int d)
{
	num *= d;
	denom *= n;
}

/******************************************************************************
* @name menu																  *
* @brief pulls of menu of possible calculations								  *
* @param None																  *
* @retval void																  *
******************************************************************************/

int Rational::menu(void)
{
	cout << endl << "1. Add a rational" << endl << "2. Subtract a rational" <<
	endl << "3. Multiply by a rational" << endl << "4. Divide by a rational" <<
	endl << "0. Exit" << endl << "Enter selection: ";
	cin >> menusel;
	switch (menusel)
	{
	case 0:
		cout << "Exiting" << endl;
		break;
	case 1:
		if (Rational::set() == 0)
		{
			menusel = 0;
			break;
		}
		Rational::check();
		Rational::add(n, d);
		Rational::check();
		Rational::display();
		break;
	case 2:
		if (Rational::set() == 0)
		{
			menusel = 0;
			break;
		}
		Rational::check();
		Rational::sub(n, d);
		Rational::check();
		Rational::display();
		break;
	case 3:
		if (Rational::set() == 0)
		{
			menusel = 0;
			break;
		}
		Rational::check();
		Rational::mul(n, d);
		Rational::check();
		Rational::display();
		break;
	case 4:
		if (Rational::set() == 0)
		{
			menusel = 0;
			break;
		}
		Rational::check();
		Rational::div(n, d);
		Rational::check();
		Rational::display();
		break;
	default: 
		try
		{
		if (menusel!= 0&&menusel!= 1&&menusel!= 2&&menusel!= 3&&menusel!= 4)
				throw 1;
		}
		catch(int)
		{
			cout << "Invalid menu input" << endl;
		}
		break;
	}
	if (menusel == 0) return 0;
	else return 1;
}
























/******************************************************************************
	* EUCLIDIAN ***************************************************************
	***************************************************************************
	*																			  
	*	gcd(a, a) = a															  
		gcd(a,b) = gcd(a-b, b) if b<a											  
		gcd(a,b) = gcd(a, b-a) if a<b											  
																				  
		n1 = num;																  
		n2 = denom;																  
		while(n1 != n2)                                                           
			gcf = n1;                                                            
		else if(n1>n2)		
		n1=n1-n2;
	 else if(n2>n1)
	 n2=n2-n1;
	 
	 num=num/n1;
	 denom=denom/n2;
	* 
	**************************************************************************/

	/**************************************************************************
	* BINARY ******************************************************************
	* *************************************************************************
	int a, b, g, d;														  *
	*																		
	*		//gcd(a, b) = g*2^d												
	*		d=0							

while (a % 2 == 0 && b % 2 == 0)
{
	a = a / 2;
	b = b / 2;
	d += 1;
}
while (a != b)
{
	if (a % 2 == 0) a = a / 2;
	else if (b % 2 == 0) b = b / 2;
	else if (a > b) a = (a - b) / 2;
	else
		b = ((b - a) / 2);
}
g = a;
*******************************************************************************
* 
	int a, b, g, d, exp, gcf, i;
	a = num;
	b = denom;
	d = 0;

	//gcd(a, b) = g*2^d			d=0

	while (a % 2 == 0 && b % 2 == 0)
	{
		a = a / 2;
		b = b / 2;
		d += 1;
	}
	while (a != b)
	{
		if (a % 2 == 0) a = a / 2;
		else if (b % 2 == 0) b = b / 2;
		else if (a > b) a = (a - b) / 2;
		else
			b = ((b - a) / 2);
	}
	g = a;

	for (exp = 2, i = 0; i < d-1; i++)
		exp *= 2;
	gcf = g * exp;
	num = num / gcf;
	denom = denom / gcf;

	output g dmmm   g*2^d
	*/