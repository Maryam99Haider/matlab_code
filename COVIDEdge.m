readim = imread('a22.jpeg');   
imwrite(readim,'indiv1.tif');   
i=imread('indiv1.tif');
figure, 
subplot(1,2,1);
imshow(i), title('original im');
 BW = im2bw(readim,0.6);
  I = edge(BW,'canny');

  subplot(1,2,2);
  imshow(I);
  title('canny detection');
  
  %imshowpair(imcomplement(BW),I,'montage'); title('binary gradient mask');
 [~, threshold] = edge(BW, 'canny');
  fudgeFactor = .5;
  BWs = edge(BW,'canny', threshold * fudgeFactor);
  %imshowpair(BW,BWs,'montage')
  
 %%%%%%%%%%%% dilation extraction
%{
 se90 = strel('line', 3, 90);%vertical structuring element// creates a flat linear structuring element
  se0 = strel('line', 3, 0);% horizontal structuring element.
  Idil = imdilate(I, [se90 se0]);
  figure, imshow(Idil), title('dilated gradient mask');
 
 %}