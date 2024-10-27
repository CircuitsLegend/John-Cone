/******************************************************************************
* sudoku.cpp																  *
******************************************************************************/
#include "sudoku.h"
#include <ctime>
#include <iostream>
#include <cstdlib>
#include <cstdbool>

int random_x, random_y, random_num;
using namespace std;

/******************************************************************************
* @name checkrow															  *
* @brief checks row of sudoku puzzle for repeat values						  *
* @param int random number and current row value							  *
* @retval int(1 if succeeded)												  *
******************************************************************************/
int Sudoku::checkrow(int z, int y1)
{
	int b, a;
	for (b = 0, a = y1; b < 9; b++)
	{
		if (z == ss[a][b])
			return 0;
	}
	return 1;
}

/******************************************************************************
* @name checkcol															  *
* @brief checks column of sudoku puzzle for repeat values					  *
* @param int random number and current column value							  *
* @retval int(1 if succeeded)												  *
******************************************************************************/
int Sudoku::checkcol(int z, int x1)
{
	int b, a;
	for (b = 0, a = x1; b < 9; b++)
	{
		if (z == (ss[b][a]))
			return 0;
	}
	return 1;
}

/******************************************************************************
* @name checkgrid															  *
* @brief checks 3x3 section of sudoku puzzles for repeat values				  *
* @param int random numbers for value & x & y								  *
* @retval int(1 if succeeded)												  *
******************************************************************************/
int Sudoku::checkgrid(int z, int y1, int x1)
{
	int mincol, maxcol, minrow, maxrow, i, j,flag;
	mincol = (x1 / 3) * 3;
	maxcol = mincol + 2;
	minrow = (y1 / 3) * 3;
	maxrow = minrow + 2;
	for (flag = 0, i = mincol; flag != 1 && i <= maxcol; i++)
	{
		for (j = minrow; flag != 1 && j <= maxrow; j++)
		{
			if (ss[j][i] == z)
			{
				flag = 1;
				return 0;
			}
		}
	}
		return 1;
}

/******************************************************************************
* @name findf																  *
* @brief finds first value to put numbers									  *
* @param pointer to x position and to y position							  *
* @retval int(1 if succeeded)												  *
******************************************************************************/
int Sudoku::findf(int *x, int *y)
{
	int i, j;
	for (i = 0, *x = 0, *y = 0; i < 9; i++)
	{
		for (j = 0; j < 9; j++)
		{
			if (xy[i][j] == 0)
			{
				*x = j;
				*y = i;

				return 1;
			}
		}
	}
	return 0;
}

/******************************************************************************
* @name findn																  *
* @brief finds next value to put numbers									  *
* @param pointer to x position and to y position							  *
* @retval int(1 if succeeded)												  *
******************************************************************************/
int Sudoku::findn(int *x, int *y)
{
	int dx, dy;
	dx = *x;
	dy = *y;
	
	while(xy[dy][dx]!=0)
	{
		dx++;
		if (dx == 9)
		{
			dx = 0;
			dy++;
			if (dy == 9)
				return 0;
		}
	}
	if (xy[dy][dx] == 0)
	{
		*x = dx;
		*y = dy;
		return 1;
	}
	return 0;
}

/******************************************************************************
* @name findp																  *
* @brief finds previous value to put numbers								  *
* @param pointer to x position and to y position							  *
* @retval int(1 if succeeded)												  *
******************************************************************************/
int Sudoku::findp(int *x, int *y)
	{
		int dx, dy;
		dx = *x;
		dy = *y;

		while (xy[dy][dx] != 1)
		{
			dx--;
			if (dx == -1)
			{
				dx = 8;
				dy--;
				if (dy == -1)
					return 0;
			}
		}
		if (xy[dy][dx] == 1)
		{
			xy[dy][dx] = 0;
			x13 =*x = dx;
			y13=*y = dy;
			return 1;
		}
		return 0;
	}

/******************************************************************************
* @name Sudoku																  *
* @brief Sudoku class constroctor which prepopulates and prints sudoku puzzle *
* @param int n (number of spaces to prepopulate)							  *
* @retval none																  *
* *****************************************************************************
* Pseudocode																  *
*																			  *
*	for however many nums to prepopulate									  *
*	assign random values													  *
*	go to position, check xy grid											  *
*	if valid move, place													  *
*	else backtrack i													      *
*	end loop																  *
*	print																	  *
******************************************************************************/
	Sudoku::Sudoku(int n)
	{

		int i, y, x, flag = 0;

		for (i = 0; i < n; i++)
		{
			random_num = (rand() % 9) + 1;
			random_x = (rand() % 9);
			random_y = (rand() % 9);

			if ((Sudoku::checkgrid(random_num, random_y, random_x)) == 1
				&&(Sudoku::checkrow(random_num, random_y)) == 1 
				&&(Sudoku::checkcol(random_num, random_x)) == 1)
			{
				if (xy[random_y][random_x] == 0)
				{
					ss[random_y][random_x] = random_num;
					xy[random_y][random_x] = 11;
				}
				else i--;
			}
			else i--;
		}
		for (y = 0, x = 0; flag != 1;)
		{
			if (x != 3 && x != 6 && x != 8)
			{
				if (ss[y][x] != 42)
					cout << ss[y][x++] << "   ";
				else cout << (char)ss[y][x++] << "   ";
			}
			else if (x == 3 || x == 6)
			{
				if (ss[y][x] != 42)
					cout << "|   " << ss[y][x++] << "   ";
				else cout << "|   " << (char)ss[y][x++] << "   ";
			}
			else if (x == 8 && y != 8)
			{
				if (ss[y][x] != 42)
					cout << ss[y++][x] << endl;
				else cout << (char)ss[y++][x] << endl;
				if (y == 3 || y == 6)
					cout << "------------+---------------+------------" << endl;
				else if (y == 9)
					flag = 1;
				x = 0;
			}
			else if (y == 8 && x == 8)
			{
				if (ss[y][x] != 42)
					cout << ss[y++][x] << endl;
				else cout << (char)ss[y++][x] << endl;
				if (y == 9)
					flag = 1;
			}
		}
	}

/******************************************************************************
* @name solve																  *
* @brief solved prepopulated array											  *
* @param none																  *
* @retval none																  *
******************************************************************************/
	int Sudoku::solve(void)
	{
		int i;

		if (!Sudoku::findf(&x13, &y13))
			return 0;

		for (i = 1; i <= 9; i++)
		{
			if ((Sudoku::checkgrid(i, y13, x13)) == 1
				&& (Sudoku::checkrow(i, y13)) == 1
				&& (Sudoku::checkcol(i, x13)) == 1)
			{
				ss[y13][x13] = i;
				xy[y13][x13] = 1;
				i = 1;
				if (!Sudoku::findn(&x13, &y13))
					return 0;
			}
			else
			{
				if (!Sudoku::findp(&x13,&y13))
					return 0;
				i = ss[y13][x13];

			}
		}
	}

/******************************************************************************
* @name printgrid															  *
* @brief prints static fancy array											  *
* @param none																  *
* @retval none																  *
******************************************************************************/
	void Sudoku::printgrid(void)
	{

		int y, x, flag = 0;
		for (y = 0, x = 0; flag != 1;)
		{
			if (x != 3 && x != 6 && x != 8)
			{
				if (ss[y][x] != 42)
					cout << ss[y][x++] << "   ";
				else
				cout << (char)ss[y][x++] << "   ";
			}
			else if (x == 3 || x == 6)
			{
				if (ss[y][x] != 42)
					cout << "|   " << ss[y][x++] << "   ";
				else cout << "|   " << (char)ss[y][x++] << "   ";
			}
			else if (x == 8 && y != 8)
			{
				if (ss[y][x] != 42)
					cout << ss[y++][x] << endl;
				else cout << (char)ss[y++][x] << endl;
				if (y == 3 || y == 6)
					cout << "------------+---------------+------------" << endl;
				else if (y == 9)
					flag = 1;
				x = 0;
			}
			else if (y == 8 && x == 8)
			{
				if (ss[y][x] != 42)
					cout << ss[y++][x] << endl;
				else cout << (char)ss[y++][x] << endl;
				if (y == 9)
					flag = 1;
			}
		}
	}