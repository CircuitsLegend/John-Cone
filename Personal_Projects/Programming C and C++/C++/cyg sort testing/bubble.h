#pragma once
#include <iostream>
using namespace std;


template <class T>
class Bubble
{
public:
/******************************************************************************
* @name Bubble																  *
* @brief default constroctor that handles the dirty work of the sorting		  *
* @param Pointer to an array of specified type, and number of elements in array
* @retval none																  *
******************************************************************************/
	Bubble(T* a, int s)
	{
		int i;
		T temp = 0;
		bool swapped;
		do
		{
			swapped = false;

			for (i = 1; i <= (s - 1); i++)
			{
				if (a[(i - 1)] > a[i])
				{
					//swap a[i-1] and a[i]
					temp = a[(i - 1)];
					a[(i - 1)] = a[i];
					a[i] = temp;
					temp = 0;
					swapped = true;
				}
			}
		} while (swapped);
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
void Bubble<T>::print(T* a, int s)
{
	int i;
	for (i = 0; i < s; i++)
		if (((i % 10) - 1) == 0)
			cout << a[i] << "," << endl;
		else
		cout << a[i] << ",     ";
}