#pragma once
#include <iostream>
using namespace std;
class node
{
private:
	friend class tree;
	int val;
	node* right;
	node* left;
/******************************************************************************
* @name node																  *
* @brief constructor sets pointers and value								  *
* @param int nnval (value of node)											  *
* @retval none																  *
******************************************************************************/
public:
	node(int nnval)
	{
		//.......setting up new node with given value and both pointers to NULL
		this->val = nnval;
		this->right = NULL;
		this->left = NULL;
	};
};
