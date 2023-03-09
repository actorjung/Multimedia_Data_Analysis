% image lab : image read/display/write

% image loading
filename = 'lena.png';

img = imread("baboon.png");
[row, col, dep] = size(img);

%image display
figure(1);
imshow(img);

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);

figure(2);
imshow([imgR,imgG,imgB]); 

imwrite([imgR,imgG,imgB], 'baboonrgb.png');
