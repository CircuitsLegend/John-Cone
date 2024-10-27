/******************************************************************************
*   MyQueue.h                                                                 *
******************************************************************************/
#pragma once
#include <iostream>
using namespace std;

template <class T>
class MyQueue
{
private:
    int top=1, siz=0, head=0;
    T q[10]{0};
public:
    /***
    @name MyQueue
    @brief creates queue
    @param none
    @retval none
    */
    MyQueue(void){}
    /***
    @name peek
    @brief non destructively returns top of queue
    @param none
    @retval T type variable
    */
    T peek(void)
    {
        try
        {
            if (siz == 0)
                throw 20;
        }
        catch (int e)
        {
            cout << "Exception: Tried to peek at an empty queue!" << endl;

            return NULL;
        }
        return q[top];
    }
    /***
   @name pop
   @brief pops off value at front of queue
   @param none
   @retval T variable
   */
    T pop(void)
    {

        try
        {
            if (siz == 0)
                throw 20;
        }
        catch (int e)
        {
            cout << "Exception: Tried to pop from an empty queue!" << endl;

            return q[siz];
        }
        T temp;
        temp = top;
        if (top == 9)
            top = -1;
        top++;
        siz--;
        return temp;
    }
    /***
   @name push
   @brief pushes variable to end of queue
   @param T variable
   @retval none
   */
    void push(T param)
    {

        try
        {
            if (siz == 10)
                throw 20;
        }
        catch (int e)
        {
            cout << "Exception:  Tried to push to a full queue!" << endl;
            return;
        }

        if (head == 9)
            head = -1;
        q[++head] = param;
        siz++;
    }
    /***
  @name clear
  @brief clears queue
  @param none
  @retval none
  */
    void clear(void)
    {
        
            int i;
            for (i = 0; i < 10; i++)
                q[i] = 0;
        
    }
    /***
   @name size
   @brief returns size of queue
   @param none
   @retval int
   */
    int size(void)
    {
        return siz;
    }
    /***
  @name full
  @brief returns true if queue is full
  @param none
  @retval bool
  */
    bool full(void)
    {
        if (siz == 10)
            return true;
        else return false;
    }
    /***
    @name empty
    @brief returns true if queue is empty
    @param none
    @retval bool
    */
    bool empty(void)
    {
        if (siz == 0)
            return true;
        else return false;
    }
};