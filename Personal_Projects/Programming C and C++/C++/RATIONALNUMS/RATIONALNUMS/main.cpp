/******************************************************************************
* main.cpp																	  *
******************************************************************************/
#include <cmath>
#include <cstdlib>
#include <iostream>
#include "rational.h"

/******************************************************************************
* @name main																  *
* @brief preforms chosen arithmetic on rational fractions from menu			  *
* @param None																  *
* @retval int																  *
*******************************************************************************
* Pseudocode:																  *
*																			  *
* Begin																	      *
*	Declerations															  *
*	Loop while exit is not selected										      *
*		menu function														  *
*	EndLoop																	  *
* End																		  *
******************************************************************************/
//Begin
int main(void)
{
	//Declerations
	using namespace std;
	int flag;

	Rational r;

	//Loop while exit is not selected
	for (flag = 1; flag != 0;)
		//menu function
		flag = r.menu();
		//EndLoop

	return 0;
}
//End