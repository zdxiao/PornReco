% for u= 1:9��%������ȡͼƬ
% img = imread(['' num2str(u) '.jpg']);%������ȡͼƬ
% img = imresize(img,[20 20]);%ͳһͼƬ��С
img1 = imread('11.jpg');%��ȡһ��ͼƬ
img = imresize(img1,[20 20]);%ͳһͼƬ��С
figure,imshow(img1)

%% ȷ��Ƥ������
hsv = rgb2hsv(img);%rgb�ռ�תΪhsv�ռ�
% figure,imshow(hsv)
s = hsv(:,:,2);%figure,imshow(s)%s����
% h = hsv(:,:,1);figure,imshow(h)%h����
% v = hsv(:,:,3);figure,imshow(v)%v����
lev = graythresh(s);%�������ֵ��
bw = im2bw(s,lev);% ��ֵ��
% figure,imshow(bw)
r = img(:,:,1);%�õ�ͼƬr����
g = img(:,:,2);%�õ�ͼƬg����
b = img(:,:,3);%�õ�ͼƬb����
rr =  immultiply(r,bw);%�õ�ͼƬ��Ƥ�������r������������figure,imshow(rr)��ͼƬ
gg =  immultiply(g,bw);%�õ�ͼƬ��Ƥ�������g������
bb =  immultiply(b,bw);%�õ�ͼƬ��Ƥ�������g����
img2 = cat(3,rr,gg,bb);%%Ƥ������(�ϲ�r,g,b��������)
% figure,imshow(img2)
%% �������������ȣ���ֵ�뷽�
area = find(bw==1);%������Ƥ����
area = length(area);%���������Ƥ����
[m,n,p] = size(img);%ͼƬ�У��У�ά��
ratio = area/(m*n); %�����
Label=4;%��˹����ز���
[mean1,variance1,afa]=gmm_em_estimation_parameter(img2,Label);%���ֵ,����
load mean %���봿Ƥ���ľ�ֵ
load variance %���봿Ƥ���ķ���
z1 = distance (mean,mean1);%��������ֵ��ŷ�Ͼ���
z2 = distance (variance,variance1);%�����������ŷ�Ͼ���
% result1 = [result1 z1 ];
% result2 = [result2 z2 ];
if z1<300 || z2 <10e+003  ||  ratio>0.2 %�ж�
    msgbox('ͼƬʶ��������ɫ��ͼƬ')%������ʾ��
else
    msgbox('ͼƬʶ����������ɫ��ͼƬ')%������ʾ��
end
    
% end
