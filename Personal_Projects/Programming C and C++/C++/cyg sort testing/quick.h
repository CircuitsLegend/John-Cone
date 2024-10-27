#pragma once
#include <iostream>
using namespace std;

template <class T>
class Quick
{
public:
void quicksort(T* a, int lo, int hi);
int partition(T* a, int lo, int hi);
/******************************************************************************
* @name Quick																  *
* @brief default constroctor that handles the dirty work of the sorting		  *
* @param Pointer to an array of specified type, and number of elements in array
* @retval none																  *
******************************************************************************/
	Quick(T* a, int s)
	{
		quicksort(a,0,s-1);
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
void Quick<T>::print(T* a, int s)
{
	int i;
	for (i = 0; i < s; i++)
		if (((i % 10) - 1) == 0)
			cout << a[i] << "," << endl;
		else
			cout << a[i] << ",     ";
}

template <class T>
void Quick<T>::quicksort(T* a, int lo, int hi)
{
	int p;
	if (lo < hi)
	{
		p = partition(a, lo, hi);
		quicksort(a, lo, p - 1);
		quicksort(a, p + 1, hi);
	}
	else return;
}
template <class T>
int Quick<T>::partition(T* a, int lo, int hi)
{
	int p=a[hi], i = lo - 1, j;
	T temp=0;

	for (j = lo; j < (hi);j++)
	{
		if (a[j] < p)
		{
			i++;
			//swap (a[i], a[j])
			temp = a[i];
			a[i] = a[j];
			a[j] = temp;
			temp = 0;
		}
	}
	//swap a[i+1], a[hi]
	temp = a[(i + 1)];
	a[(i + 1)] = a[hi];
	a[hi] = temp;
	temp = 0;
	return i + 1;
}