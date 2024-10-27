/******************************************************************************
* Function Title: main												  		  *
*																			  *
* Summary: accesses an imported file and reads characters from it, stores 	  *
* them in dynamocally allocated storage, Sorts them, and prints them and their*
* associated roots, cube roots, and fourth roots in another file imported by  *
* the user.																	  *
*																			  *
* Inputs: two text files													  *
* Outputs: None																  *
* 																			  *
* Compile Instructions: make	....... ./RootTable.exe ...txt ...txt		  *
*******************************************************************************
* Pseudocode: 																  *
*																			  *
* Begin																		  *
*	declare variables														  *
*	check to see right number of input files								  *
*	open input file for reading												  *
*	call LinkedList function												  *
*	open output file for writing											  *
*	call PrintOutput														  *
*	call freelist															  *
* End																		  *
******************************************************************************/
//Begin
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define INPUT_FILE (*(argv+1))
#define OUTPUT_FILE (*(argv+2))
#include "myLinkedList.h"

int main(int argc, char **argv)
{
	//declare variables
	struct node* L;
	
	int x;
	
	FILE *fp1, *fp2;
	//check to see right number of input files
		if (argc!=3)
			printf("Not enough files supplied!");
	//open input file for readin
	fp1=fopen(INPUT_FILE,"r");
		if ((fp1)==NULL)
			printf("Cannot open. Error in Input File"); 
		//call LinkedList function
	L=LinkedList(L, fp1);
		if (L==NULL)
			printf("return of final linked list failed");
	
	//open output file for writing
	fp2=fopen(OUTPUT_FILE,"w");
		if ((fp2)==NULL)
			printf("Cannot open. Error in Output File"); 
		//call PrintOutput
	PrintOutput(L, fp2);
	//call freelist
	freelist(L);
	
	return 0;
}
//End