clear all;


I=imread('a43.jpeg');
figure;
subplot(1,2,1);
imshow(I);
title('original image');

T = graythresh(I)  % find the threshold for input image

bw = im2bw(I,T);% Segment the image using thresholding

subplot(1,2,2),
imshow(imcomplement(bw));
title('thresholding image');

