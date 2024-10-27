#pragma once
#include <fstream>
#include "node.h"
static ofstream ofile;
class tree
{
private:
	node* root;
public:
	tree() { root = NULL; };
	void addn(int);
	void del3te(int);
	void printtree(node* n, ofstream& outfile);
	node* getroot(void);
	void del3te_tree(node*);
	~tree();
};