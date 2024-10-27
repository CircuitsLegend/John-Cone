/******************************************************************************
* @name main																  *
* @brief takes input file and adds or deletes values in a binary tree before  *
*		 printing each value and its base 10 log in the output file			  *
* @param two command line arguments input and output files					  *
* @retval int (return 0)													  *
******************************************************************************/
#include <fstream>
#include <iostream>
#include "tree.h"
#define INPUT_FILE (*(argv+1))
#define OUTPUT_FILE (*(argv+2))
int main(int argc, char** argv)
{

	ifstream infile;
	
	int A;
	char a;

	if (argc==3) //...........................making sure command line is valid
	{
		//........................................................opening files
		infile.open(INPUT_FILE, ios::in);

		ofile.open(OUTPUT_FILE, ios::out);

		tree t;

		if (!ofile.is_open())
		{
			std::cout << "Could not open output file " << OUTPUT_FILE << ".";
		}

		if (!infile.is_open())
		{
			std::cout << "Could not open input file " << INPUT_FILE << ".";
		}

		while (!infile.eof())
		{
			
			infile >> a >> A;

			if (a == 'a')
				t.addn(A);//......................................add A to list
			else if (a == 'd')
				t.del3te(A); //..............................delete A from list
		}
				//.....................................................printing
		t.printtree(t.getroot(), ofile);
		infile.close();
		ofile.close(); //...........................................close files
	}
	else std::cout << "Invalid number of command line arguments!";

	return 0;
}