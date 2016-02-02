#include "calSkinRatio.h"

#include <iostream>
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

int main()
{
	Mat img = imread("/home/xiao/Project/PornReco/skinDetection/images/test0110/face.jpg");
	double ratio = calSkinRatio(img);
	cout << "skin ratio: " << ratio << endl;
	return 0;
}
