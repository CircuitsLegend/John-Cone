/******************************************************************************
*   MyStack.h                                                                 *
******************************************************************************/
#pragma once
#include <iostream>
using namespace std;

template <class T>
class MyStack
{
private:
    int top=0;
    T s[10]{0};
public:
    /***
    @name MyStack
    @brief creates stack
    @param none
    @retval none
    */
    MyStack(void){}
    /***
    @name peek
    @brief non destructively returns top of stack
    @param none
    @retval T type variable
    */
    T peek(void)
    { 
        try
        {
            if (top == 0)
                throw 20;
        }
        catch (int e)
        {
            cout << "Exception: Tried to peek at an empty stack!" << endl;

            return NULL;
        }
        return s[(--top)++];
        
    }
    /***
    @name pop
    @brief pops off value at front of stack
    @param none
    @retval T variable
    */
    T pop(void)
    {
        try
        {
            if (top == 0)
                throw 20;
        }
        catch (int e)
        {
            cout << "Exception: Tried to pop from an empty stack!" << endl;

            return s[top];
        }
        return s[--top];
    }
    /***
    @name push
    @brief pushes variable to top of stack
    @param T variable
    @retval none
    */
    void push(T param)
    {
        try {
            if (top == 10)
                throw 20;
        }
        catch(int e) {
            cout << "Exception:  Tried to push to a full stack!" << endl;
            return;
        }

        s[top++] = param;
    }
    /***
    @name clear
    @brief clears stack
    @param none
    @retval none
    */
    void clear(void)
    {
        int i;
        for (i = 0; i < 10; i++)
            s[i] = 0;
    }
    /***
    @name size
    @brief returns size of stack
    @param none
    @retval int
    */
    int size(void)
    {
        return top;
    }
    /***
    @name full
    @brief returns true if stack is full
    @param none
    @retval bool
    */
    bool full(void)
    {
        if (top == 10)
            return true;
        else return false;
    }
    /***
    @name empty
    @brief returns true if stack is empty
    @param none
    @retval bool
    */
    bool empty(void)
    {
        if (top == 0)
            return true;
        else return false;
    }
};