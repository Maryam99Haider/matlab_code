image=imread('20.jpg');

im = im2single(image);

XY = im(:,:,2);
XZ = squeeze(im(3,:,:));

figure
imshow(XY,[],'Border','tight');
imshow(XZ,[],'Border','tight');
BW = XY > 5.098000e-01;
BW = imcomplement(BW);
BW = imclearborder(BW);
BW = imfill(BW, 'holes');
radius = 3;
decomposition = 0;
se = strel('disk',radius,decomposition);
BW = imerode(BW, se);
maskedImageXY = XY;
maskedImageXY(~BW) = 0;
imshow(maskedImageXY)
