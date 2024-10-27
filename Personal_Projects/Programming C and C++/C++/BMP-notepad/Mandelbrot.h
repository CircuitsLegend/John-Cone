/******************************************************************************
****Mandelbrot.h***************************************************************
******************************************************************************/
#pragma once
#include <array>
#include <random>
#include <iostream>
#include <fstream>
#include <string>
using namespace std;
class Mandelbrot
{
public:
/******************************************************************************
* @name Mandelbrot															  *
* @
******************************************************************************/

	Mandelbrot()
	{
		int i, j;

		//rand number
		random_device rd;     // Only used once to initialise (seed) engine
		mt19937 rng(rd());    // Random-number engine used (Mersenne-Twister in this case)
		uniform_int_distribution<int> uni(1, 3); // Guaranteed unbiased

		int color_variant = uni(rng);

		string strang = "mandelbrot_" + to_string(color_variant) + ".bmp";

		ofstream myfile;
		myfile.open(strang, ios::binary | ios::out);

		//writing bmp_header
		for (auto itt = bmp_header.begin(); itt != bmp_header.end(); ++itt)
			myfile << *itt;
		//writing dib_header
		for (i = 0; i < 40; i++)
			myfile << dib_header[i];


		//writing pixel data
		int py, px, iteration, max_iteration;
		double x0, y0, x, y, xtemp;
		unsigned char c;

		//nested for loop for rows and colums  Px(0-7999), Py(0-4570) is location of each pixel
		for (py = 0; py < 4571; py++)
			for (px = 0; px < 8000; px++)
			{
				// x0 y0 scaled coordinates
				x0 = 0.000438 * (px)-2.5;
				y0 = 0.000438 * (py)-1;
				x = 0.0, y = 0.0;
				iteration = 0, max_iteration = 1000;
				do
				{
					xtemp = x * x - y * y + x0;
					y = 2 * x * y + y0;
					x = xtemp;
					iteration++;
				} while (x * x + y * y <= 2 * 2 && iteration < max_iteration);
				//color pallete function
				if (iteration >= 999)
					myfile << 0x00 << 0x00 << 0x00;
				else
					switch (color_variant)
					{
					case 1: //blue
						myfile << (unsigned char)(iteration / 4) << 0x01 << 0x01;
						break;
					case 2: //green
						myfile << 0x01<< (unsigned char)(iteration / 4) <<0x01;
						break;
					case 3: //red
						myfile << 0x01 << 0x01 << (unsigned char)(iteration / 4);
						break;
					default:break;
					}
				cout << "y:  " << y0 << endl << endl;
				//(Blue, Green, Red)
				// the closer it gets to 1000 increase the color brightness for fun

				//plot point(x,y,color)
			}
	};
	
private:
	array <unsigned char, 14> bmp_header
	= {
		//ID field (42h, 4Dh)
		'B','M',

		//Size of the BMP file (54 bytes header + 16 bytes data)
		0x76, 0xF3, 0x89, 0x06,

		0x00, 0x00,//Application specific
		0x00, 0x00,//Application specific

		//Offset where the pixel array (bitmap data) can be found
		0x36, 0x00, 0x00, 0x00
	};
	array <unsigned char, 40> dib_header
	= {
		//Number of bytes in the DIB header (from this point) 40bytes
		0x28, 0x00, 0x00, 0x00,

		0x40, 0x1F, 0x00, 0x00,//Width of the bitmap in pixels
		0xDB, 0x11, 0x00, 0x00,//Height of the bitmap in pixels. 
		//^^Positive for bottom to top pixel order.
		0x01, 0x00,//Number of color planes being used
		0x18, 0x00,//Number of bits per pixel
		0x00, 0x00, 0x00, 0x00,//BI_RGB, no pixel array compression used
		0x40, 0xF3, 0x89, 0x06,//size of the raw bitmap data(including padding)
		0x13, 0x0B, 0x00, 0x00,//Print resolution of the image, 
		//72 DPI × 39.3701 inches per metre yields 2834.6472
		0x13, 0x0B, 0x00, 0x00,//^^^
		0x00, 0x00, 0x00, 0x00,//Number of colors in the palette
		0x00, 0x00, 0x00, 0x00//0 means all colors are important
		
	};	
/*
for each pixel (Px, Py) on the screen do //nested for loops row column outer loop from 0 to 4570  then 0 to 7999
x0 := scaled x coordinate of pixel (scaled to lie in the Mandelbrot X scale (-2.00, 0.47))
y0 := scaled y coordinate of pixel (scaled to lie in the Mandelbrot Y scale (-1.12, 1.12))
x := 0.0
y := 0.0
iteration := 0
max_iteration := 1000
while (x*x + y*y ≤ 2*2 AND iteration < max_iteration) do
	xtemp := x*x - y*y + x0
	y := 2*x*y + y0
	x := xtemp
	iteration := iteration + 1

color := palette[iteration] //iteration 0 + 1000 if 1000, make black else r=0 g=0 b=iteration/4 //for other colors do one of the respective
plot(Px, Py, color)
*/
};