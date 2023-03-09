%영상로드
fname = 'lena.png';
img = imread(fname);
%figure(1);
%imshow(img);

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);
%figure(2);
%imshow([imgR, imgG,imgB]);


hgram = imhist(imgB);
figure(2);
imshow(hgram)
stem(hgram,'k.');

xmax= max(max(imgB))-30;

xmin= min(min(imgB))+30;

a = 255/(xmax-xmin);
b = -((255*xmin)/(xmax-xmin));
img1 = imgB*a + b;
%figure(3)
%imshow([imgB,img1])

figure(3)
imhist(img1)

imgbeq = histeq(imgB);
figure(4);
imshow([imgB, imgbeq]);

imhist(imgbeq)


