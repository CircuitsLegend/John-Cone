#ifndef MYLINKEDLIST_H
#define MYLINKEDLIST_H
#include <stdio.h>
struct node
{
	int value;
	struct node *next;
};

struct node *LinkedList(struct node *first, FILE *fp1);

void PrintOutput(struct node *first, FILE *fp2);

void freelist(struct node *first);

#endif