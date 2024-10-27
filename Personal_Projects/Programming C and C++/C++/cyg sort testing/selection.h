#pragma once
#include <iostream>
using namespace std;

template <class T>
class Selection
{
public:
/******************************************************************************
* @name Selection															  *
* @brief default constroctor that handles the dirty work of the sorting		  *
* @param Pointer to an array of specified type, and number of elements in array
* @retval none																  *
******************************************************************************/
	Selection(T* a, int s)
	{
		int i, j, iMin;
		T temp=0;
		for (j = 0; j < s - 1; j++)
		{
			iMin = j;
			for (i = j + 1; i < s; i++)
			{
				if (a[i] < a[iMin])
				{
					iMin = i;
				}
			}
			if (iMin != j)
			{
				//swap(a[j], a[iMin]);
				temp = a[j];
				a[j] = a[iMin];
				a[iMin] = temp;
				temp = 0;
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
void Selection<T>::print(T* a, int s)
{
	int i;
	for (i = 0; i < s; i++)
		if (((i % 10) - 1) == 0)
			cout << a[i] << "," << endl;
		else
			cout << a[i] << ",     ";
}

