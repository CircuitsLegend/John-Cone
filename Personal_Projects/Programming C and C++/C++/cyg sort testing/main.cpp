#include <random>
#include <chrono>
#include "bubble.h"
#include "selection.h"
#include "insertion.h"
#include "quick.h"
#define N 100000
using namespace std;
int main(void)
{

	int i, seed, nums[N];



	//random number
	seed = (int)(std::chrono::system_clock::now().time_since_epoch().count());
	std::default_random_engine generator(seed);
	std::uniform_int_distribution<int> distribution(0, 999);



	for (i = 0; i < N; i++)
	{
		nums[i] = distribution(generator);
	}



	//Bubble <int> s(nums, N);
	//Selection <int> s(nums, N);
	//Insertion <int> s(nums, N);
	Quick <int> s(nums, N);
	s.print(nums, N);

	return 0;
}

//time ./executable    for cygwin report
//y axis is time x axis is Number of elements each line will be sorting algorithm   each point of each line is an average