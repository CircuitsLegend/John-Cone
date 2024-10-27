/******************************************************************************
* @name 	main															  *
* @brief 	Opens file and then prints the functions zeroes to the output file*
* @param 	Input file and an optional output file							  *
* @retval 	int(returns zero but the output of the program are the zeroes)	  *
*																			  *
* Compile Instructions: make (g++ QUADFORM.cpp -o qr.exe)					  *
*******************************************************************************
* Pseudocode:																  *
*																			  *
* Begin																		  *
*	Macros																	  *
* 	Check number of command line arguments									  *
* 	Depending on argc print to screen or to output file						  *
*	Open input file															  *
*	Loop																	  *
*	read in A B and C														  *
*	Preform neccesary arithmetic											  *
*	if argc == 3 then print to file											  *
*	if argc == 2 then print to screen										  *
*	print A\tB\tC\tz1\tz2 \newl												  *
*	end loop till eof 														  *
*	close files																  *
* End																		  *
******************************************************************************/
//Begin
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cstring>
#include <cmath>
/** Macros*/
#define INPUT_FILE (*(argv+1))
#define OUTPUT_FILE (*(argv+2))

	int main(int argc, char **argv)
{
	using namespace std;

	ifstream infile;
	ofstream ofile;
	int A, B, C;
	float z1, z2;
	
		if(argc<4&&argc>1)
		{
						//Check number of command line arguments
						//Depending on argc print to screen or to output file
			if(argc==2)
			{
				
				infile.open(INPUT_FILE, ios::in); //Open input file
				
				if(!infile.is_open())
				{
					
					cout<<"Could not open input file "<<INPUT_FILE<<".";
				}
				else while(!infile.eof()) //Loop
				{
					
					infile>>A>>B>>C; //read in A B and C
					
					if ((B*B-(4*(A*C)))<0)
						cout<<A<<"\t"<<B<<"\t"<<C<<"\t"<<"complex"<<endl;
					else //Preform neccesary arithmetic	
					{
						cout.precision(4);
						z1= (float)(-B+sqrt(B*B-(4*(A*C))))/(float)(2*A);
						z2= (float)(-B-sqrt(B*B-(4*(A*C))))/(float)(2*A);
						cout<<fixed<<A<<"\t"<<B<<"\t"<<C<<"\t"<<z1<<"\t"<<z2<<endl;
					}
				}	
				infile.close();
			}
			//if argc == 3 then print to file
			//if argc == 2 then print to screen
			else if(argc==3)
			{
				infile.open(INPUT_FILE, ios::in);
				
				ofile.open(OUTPUT_FILE, ios::out);
				
				if(!ofile.is_open())
				{
					
					cout<<"Could not open output file "<<OUTPUT_FILE<<".";
				}
				
				if(!infile.is_open())
				{
					
					cout<<"Could not open input file "<<INPUT_FILE<<".";
				}
				else while(!infile.eof())
				{
					
					infile>>A>>B>>C;
					
					
					if ((B*B-(4*(A*C)))<0)
						ofile<<A<<"\t"<<B<<"\t"<<C<<"\t"<<"complex"<<endl;
					else 
					{
						cout.precision(4);
						ofile.precision(4);//print A\tB\tC\tz1\tz2 \newl	
						z1= (float)(-B+sqrt(B*B-(4*(A*C))))/(float)(2*A);
						z2= (float)(-B-sqrt(B*B-(4*(A*C))))/(float)(2*A);
						ofile<<fixed<<A<<"\t"<<B<<"\t"<<C<<"\t"<<z1<<"\t"<<z2<<endl;
					}
				}	//end loop till eof 
				infile.close();
				ofile.close();//close files
			}
			
			
		}
		else cout<<"Invalid number of command line arguments!";
		
		
			
	return 0;
}
//End