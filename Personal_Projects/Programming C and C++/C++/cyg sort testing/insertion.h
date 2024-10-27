#pragma once
#include <iostream>
using namespace std;

template <class T>
class Insertion
{
public:
/******************************************************************************
* @name Insertion															  *
* @brief default constroctor that handles the dirty work of the sorting		  *
* @param Pointer to an array of specified type, and number of elements in array
* @retval none																  *
******************************************************************************/
	Insertion(T* a, int s)
	{
		int i, j;
		T temp=0;
		for (i=1;i<s;i++)
		{
			j = i;
			while (j>0&&a[(j-1)]>a[j])
			{
			//swap(a[j], a[j-1])
				temp = a[j];
				a[j] = a[(j - 1)];
				a[(j - 1)] = temp;
				temp = 0;
				j--;
			}
		}
	};
	void print(T* a, int s);
};
/******************************************************************************
* @name print																  *
* @brief prints the sorted array											  *
* @param Pointer to an array of specified type, and number of elements in array
* @retval none																  *
******************************************************************************/
template <class T>
void Insertion<T>::print(T* a, int s)
{
	int i;
	for (i = 0; i < s; i++)
		if (((i % 10) - 1) == 0)
			cout << a[i] << "," << endl;
		else
			cout << a[i] << ",     ";
}