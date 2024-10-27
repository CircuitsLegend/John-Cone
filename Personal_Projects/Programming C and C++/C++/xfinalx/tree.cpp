#include <cmath>
#include "tree.h"
/******************************************************************************
* @name addn                                                                  *
* @brief adds node in sorted-ish place ignorin duplicates                     *
* @param int (value of node)                                                  *
* @retval none                                                                *
******************************************************************************/
void tree::addn(int nval)
{
    node* temp = new node(nval);
    if (root == NULL)
        root = temp; //.........................................list empty case
    else
    {
        node* p=root;
        for (;;)
        {
            if (temp->val < p->val)
            {
                if (p->left != NULL)
                    p = p->left;
                else
                {
                    p->left = temp;
                    return;
                }
            }
            else if (temp->val > p->val)
            {
                if (p->right != NULL)
                    p = p->right;
                else
                {
                    p->right = temp;
                    return;
                }
            }
            else //...........................temp->val must be equal to p->val
            {
                delete temp;
                return;
            }
        }
    }
}
/******************************************************************************
* @name del3te                                                                *
* @brief deletes node with specified value if it exists                       *
* @param int (value of node)                                                  *
* @retval none                                                                *
******************************************************************************/
void tree::del3te(int nval)
{
    node* prev;
    node* cur;

    if (root == NULL)
        return;
    else if (root->left == NULL && root->right == NULL&&root->val==nval)
    {
        cur = root;
        root = NULL;
        delete cur;
    }
    else 
    {
        cur = root;
        prev = NULL;

        while (cur->val!=nval)  //getting cur pointer on the node to be deleted
        {
            if (cur->val < nval)
            {
                if (cur->right == NULL)
                    return;
                else
                {
                    prev = cur;
                    cur = cur->right;
                }
            }
            else if (cur->val > nval)
            {
                if (cur->left == NULL)
                    return;
                else
                {
                    prev = cur;
                    cur = cur->left;
                }
            }
        }
        //...................................node to be deleted has no children
        if (cur->left == NULL && cur->right == NULL)
        {
            if (prev == NULL)
            {
                delete cur;
            }
            else if (prev->val < cur->val)
            {
                prev->right = NULL;
                delete cur;
            }
            else
            {
                prev->left = NULL;
                delete cur;
            }
        }
        //......................................................only left child
        else if (cur->right == NULL && cur->left != NULL)
        {
            if (prev == NULL)
            {
                root = cur->left;
                delete cur;
            }
            else if (cur->val > prev->val)
            {
                prev->right = cur->left;
                delete cur;
            }
            else
            {
                prev->left = cur->left;
                    delete cur;
            }
        }
        //.....................................................only right child
        else if (cur->right != NULL && cur->left == NULL)
        {
            if (prev == NULL)
            {
                root = cur->right;
                delete cur;
            }
            else if (cur->val > prev->val)
            {
                prev->right = cur->left;
                delete cur;
            }
            else
            {
                prev->left = cur->left;
                delete cur;
            }
        }
        //.........................................................two children
        else if (cur->left != NULL && cur->right != NULL)
        {
            node* t = cur;

            cur = cur->left;
                
            while (cur->right != NULL)
            {
                prev = cur;
                cur = cur->right;
            }
                
            if(prev==NULL)
            { 
                t->val = cur->val;
                root = cur->left;
                delete cur;
            }
            else 
            {
                t->val = cur->val;
                prev->right = cur->left;
                delete cur;
            }
        }
    }
}
/******************************************************************************
* @name printtree                                                             *
* @brief prints binary tree with its log base 10 values                       *
* @param root of tree(pointer to first node in tree)                          *
* @retval none                                                                *
******************************************************************************/
void tree::printtree(node* n, ofstream &outfile)
{
    if (n!=NULL)
    {
        outfile.precision(4); //.............................4 decimal accuracy

        //...............................................print n’s left subtree
        printtree(n->left, outfile);
        //..............................................................print n
        outfile << n->val << "\t" << std::fixed << log10(n->val) << endl;
        //..............................................print n's right subtree
        printtree(n->right, outfile);
    }
}
/******************************************************************************
* @name getroot                                                               *
* @brief makes pointer to root of tree accesible                              *
* @param none                                                                 *
* @retval node pointer(root)                                                  *
******************************************************************************/
node* tree::getroot(void)
{
    return root;
}
/******************************************************************************
* @name ~tree                                                                 *
* @brief deletes storage container when finished                              *
* @param none                                                                 *
* @retval none                                                                *
******************************************************************************/
tree::~tree() 
{
    del3te_tree(root);
}
/******************************************************************************
* @name del3te_tree                                                           *
* @brief goes through and deletes each node                                   *
* @param node pointer to root                                                 *
* @retval none                                                                *
******************************************************************************/
void tree::del3te_tree(node* rootn) 
{
    if (rootn!=NULL)
    {
        //.....................................................n’s left subtree
        del3te_tree(rootn->left);
        
        //....................................................n's right subtree
        del3te_tree(rootn->right);
            
        //..........................................................delete node
        delete rootn;
    }
    return;
}
/*
adding nodes

 Create temporary pointer “p” and point it to root
 Loop forever
   If new node < p
     If left branch exists
       take left branch
     Else
       create left branch
       return
     EndIf
   Else If new node > p
     If right branch exists
       take right branch
     Else
       create right branch
       return
     EndIf
   Else (new node’s value is already in tree)
     throw away new node
     return
   EndIf
 EndLoop
 */
/*
deleting nodes

if root = null
do nothing


deleting w no children
start cur at root with previous trailing
        c=root p=null

if cur has zero children

if p->value < cur->value
p->right=NULL
else
p->left=NULL

^loop until cur is on number

then delete cur

if node is only one in list so if both node pointers are null
p=NULL
cur=root
delete root node
set root to null


delete node with only left child

start cur at root with previous trailing
        cur=root prev=null

        go until cur is on value

        if cur->val > prev->val
        then prev->right = cur->left
        else
        prev->left = cur->left
        delete cur


    ^^repeat for right child

    start cur at root with previous trailing
        cur=root prev=null

        go until cur is on value

        if cur->val > prev->val
        then prev->right = cur->right
        else
        prev->left = cur->right
        delete cur


        cur has two children

        needing three pointers t is value deleting

        left one step then right forever until null
        then REPLACE value in the node trying to get rid of with the end one^^^

        t->val=c->val
        p->right=c->left
        delete c

        deleting root node---- special case to consider especially with two p's
*/