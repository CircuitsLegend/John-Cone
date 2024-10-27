#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "myLinkedList.h"

/******************************************************************************
* Function Title: LinkedList												  *
*																			  *
* Summary: read values, store in sorted linked list with duplicates removed	  *
*																			  *
* Inputs: pointer to head of list, pointer to input file					  *
* Outputs: pointer to head of list											  *
* 																			  *
* 																			  *
*******************************************************************************
* Pseudocode: 																  *
*																			  *
* Begin																		  *
*	loop until end of input file											  *
* 	read a number(input) from input											  *
*	straddle position in linked list										  *
*	if input isnt repeated													  *
*	create new node															  *
*	assign values to new node												  *
*	return pointer to first node											  *
* End																		  *
******************************************************************************/
//Begin
struct node *LinkedList(struct node *first, FILE *fp1)
{
	
	struct node *cur, *prev, *new_node;

	int x;
	//loop until end of input file	
	for(x=0;!feof(fp1);)
	{
		//read a number(input) from input		
		fscanf(fp1, "%d\n", &x);
	
		//straddle position in linked list
		for (cur=first,prev=NULL;
		cur!=NULL && cur->value>x;prev=cur,cur=cur->next);
		
		//if input isnt repeated
		if (cur->value!=x)	
		{
			//create new node
			if (first==NULL)
			first = malloc(sizeof(struct node));
		if (first==NULL)
			printf("first node in linked list failed");
			
			new_node=(struct node*)malloc(sizeof(struct node));
			if (new_node==NULL)
			printf("new_node failed");

			//assign values to new node
			new_node->next=cur;
			
			if (prev==NULL)
			{
			first = new_node;
			new_node->value=x;
			}
			else
			{
			prev->next=new_node;
			new_node->value=x;
			}
		}
	}
	//return pointer to first node	
	return first;
}
//End

/******************************************************************************
* Function Title: PrintOutput												  *
*																			  *
* Summary: prints linked list to file                                   	  *
*																			  *
* Inputs: pointer to head of list, pointer to output file					  *
* Outputs: none																  *
* 																			  *
* 																			  *
*******************************************************************************
* Pseudocode: 																  *
*																			  *
* Begin																		  *
*	Declare variables														  *
*	find number of nodes  													  *
*	loop until first node													  *
*	print values															  *
* End																		  *
******************************************************************************/
//Begin
void PrintOutput(struct node *first, FILE *fp2)
{
	//Declare variables	
	struct node *ptr = first, *prev, *cur,*del;
	
	int flag,x;
	
	for (ptr=first,cur=ptr,prev=NULL;cur->next!=NULL;prev=cur,cur=cur->next);
	
	prev->next=NULL;

	//find number of nodes
	for (x=0,del=NULL,ptr=first;ptr->next!=NULL;del=ptr,ptr=ptr->next,x++);
	//loop until first node
	for(;x>=0;x--)
	{
		for (flag=0,ptr=first;flag<x;flag++)
		{
			ptr=ptr->next;
		}
		//print values
		fprintf(fp2, "%d\t%.4f\t%.4f\t%.4f\n",ptr->value,sqrt(ptr->value),
		cbrt(ptr->value),sqrt(sqrt(ptr->value)));
	}
}
//End

/******************************************************************************
* Function Title: freelist													  *
*																			  *
* Summary: frees all allocated memory                                   	  *
*																			  *
* Inputs: pointer to head of list											  *
* Outputs: none																  *
* 																			  *
* 																			  *
*******************************************************************************
* Pseudocode: 																  *
*																			  *
* Begin																		  *
*	loop until end of list then incrementing pointers						  *
*	free memory allocation and appropriate pointer							  *
* End																		  *
******************************************************************************/
//Begin
void freelist(struct node *first)
{
	//loop until end of list then incrementing pointers	
	struct node* nnode;
	
	for (nnode=first->next;nnode!=NULL;nnode=nnode->next)
	{
		//free memory allocation and appropriate pointer
		free(first);
		first=nnode;
	}
}
//End