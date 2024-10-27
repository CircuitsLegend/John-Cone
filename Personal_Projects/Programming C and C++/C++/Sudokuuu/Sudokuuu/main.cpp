#include "sudoku.h" 
#include <ctime>
#include <iostream>
#include <cstdlib>


using namespace std;
/******************************************************************************
* @name main																  *
* @brief solves random sudoku puzzle with inputted number of prepopulation	  *
* @param void																  *
* @retval int																  *
******************************************************************************/
int main()
{
	int n;

	srand(time(NULL));

	cout << "Welcome to SudokuSolver!!" << endl;
	cout << "Enter number of squares to prepopulate: ";
	cin >> n;
	if (n < 0 || n>81)
	{
		cout << "Error: not a valid number to prepopulate with." << endl;
	}
	else
	{
		cout << endl;

		Sudoku s(n);
		if ((s.solve())==1)
		{
			cout << endl << "Solved!" << endl << endl;
			s.printgrid();
		}
		else
		{
			cout << "Sorry, unsolvable..." << endl;
		}
	}
	return 0;
	
}