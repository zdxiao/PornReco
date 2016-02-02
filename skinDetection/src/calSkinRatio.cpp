#include "xzdImageProcess.h"
#include "calSkinRatio.h"

#include <iostream>
#include <opencv2/opencv.hpp>

//#define DEBUG

using namespace std;
using namespace cv;

double calSkinRatio(Mat img)
{
	Mat hueImg, segedImg;
	bgr2hue(img, hueImg, 0.1);
	hueImgBinarySegment(hueImg, segedImg, 10, 10);
	int brightCounter = 0;
	for(int row = 0; row != segedImg.rows; ++row)
	{
		uchar *p = segedImg.ptr<uchar>(row);
		for(int col = 0; col != segedImg.cols; ++col)
		{
			if(*p++ == 255)
			{
				++brightCounter;
			}
		}
	}
	double ratio = brightCounter / double(segedImg.rows * segedImg.cols);
#ifdef DEBUG
	cout << ratio << endl;
	namedWindow("hue image", 0);
	imshow("image", img);
	namedWindow("image", 0);
	imshow("hue image", hueImg);
	namedWindow("seged image", 0);
	imshow("seged image", segedImg);
	waitKey();
#endif
	return ratio;
}
