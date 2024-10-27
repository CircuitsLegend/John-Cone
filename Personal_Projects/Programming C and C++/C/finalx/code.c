/******************************************************************************
* Function Title: delete_student
*
* Summary: searches linked list 
*
* Inputs: pointer to first node in list, pointer to string containing last name
* to be deleted, and honestly idk what new_last name is for (it sounds like you
* want me to find the node with the last name to be deleted then replace the 
* name with the new one but I'm just going to delete the node
*
* Outputs: pointer to fist node of new list
*******************************************************************************
* Pseudocode
* Begin
* 	search for node
*	if doesn't exist return pointer to fist node
* 	change pointers around node
* 	free undesired node
*	return first node to new list
* End
******************************************************************************/
//Begin
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct student {
char *first_name;
char *last_name;
struct student *next;
};

struct student *delete_student(struct student *first,
char *last_name,
char *first_name)
{
	//search for node
	struct student *cur, *prev, *list, *del;
    int x, y;
	for (prev = NULL, cur = first; (strcmp(cur->last_name, last_name) != 0) &&
		(strcmp(cur->first_name, first_name) != 0); prev = cur, cur = cur->next)
		//if doesn't exist return pointer to fist node
	{
		if (cur->next == NULL && (strcmp(cur->first_name, first_name) != 0))
		{
			printf("Student first name doesn't exist");
			return first;
		}
		if (cur->next == NULL && (strcmp(cur->last_name, last_name) != 0))
		{
			printf("Student last name doesn't exist");
			return first;
		}
	}
	//change pointers around node
	prev->next=cur->next;
	del=cur;
	cur=NULL;
	//free undesired node
	free(del);

	//return first node to new list
	return first;
}
//End