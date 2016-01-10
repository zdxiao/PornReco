% for u= 1:9　%连续读取图片
% img = imread(['' num2str(u) '.jpg']);%连续读取图片
% img = imresize(img,[20 20]);%统一图片大小
img1 = imread('11.jpg');%读取一张图片
img = imresize(img1,[20 20]);%统一图片大小
figure,imshow(img1)

%% 确定皮肤区域
hsv = rgb2hsv(img);%rgb空间转为hsv空间
% figure,imshow(hsv)
s = hsv(:,:,2);%figure,imshow(s)%s分量
% h = hsv(:,:,1);figure,imshow(h)%h分量
% v = hsv(:,:,3);figure,imshow(v)%v分量
lev = graythresh(s);%求最佳阈值　
bw = im2bw(s,lev);% 二值化
% figure,imshow(bw)
r = img(:,:,1);%得到图片r分量
g = img(:,:,2);%得到图片g分量
b = img(:,:,3);%得到图片b分量
rr =  immultiply(r,bw);%得到图片中皮肤区域的r分量，可运行figure,imshow(rr)看图片
gg =  immultiply(g,bw);%得到图片中皮肤区域的g分量，
bb =  immultiply(b,bw);%得到图片中皮肤区域的g分量
img2 = cat(3,rr,gg,bb);%%皮肤区域(合并r,g,b三个分量)
% figure,imshow(img2)
%% 计算参数（面积比；均值与方差）
area = find(bw==1);%找区域（皮肤）
area = length(area);%计算面积（皮肤）
[m,n,p] = size(img);%图片行，列，维数
ratio = area/(m*n); %面积比
Label=4;%高斯的相关参数
[mean1,variance1,afa]=gmm_em_estimation_parameter(img2,Label);%求均值,方差
load mean %载入纯皮肤的均值
load variance %载入纯皮肤的方差
z1 = distance (mean,mean1);%计算两均值的欧氏距离
z2 = distance (variance,variance1);%计算两方差的欧氏距离
% result1 = [result1 z1 ];
% result2 = [result2 z2 ];
if z1<300 || z2 <10e+003  ||  ratio>0.2 %判断
    msgbox('图片识别结果：是色情图片')%弹出显示框
else
    msgbox('图片识别结果：不是色情图片')%弹出显示框
end
    
% end
