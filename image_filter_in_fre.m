%image filtering in frequency domain

fname = 'baboon.png';
img = imread(fname);

fnamemsk = 'imgcir.png';
imgmsk = imread(fnamemsk);

figure(1)
imshow(img);
figure(2)
imshow(imgmsk);

imgF = imgFilterFreqMsk(img,imgmsk);
figure(3);
imshow(uint8(imgF));









