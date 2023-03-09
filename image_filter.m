%image filtering
fname = 'c.jp';
img = imread(fname);


imshow(img);

% filter coeff. h
h = [1 2 3 4 5 4 3 2 1]; %1-D filter

h = h/sum(h);

hh = h(:)*h(:)'; %2-D filter corff.

imgR = double(img(:,:,1));
imgRfil = conv2(imgR,hh);
%imgG = double(img(:,:,2));


%imgfil = conv2(img, hh); ->2차원 3차원 충돌
imgfil = imfilter(img,hh);

figure(2);
imgRfil = imgRfil(4:511+4, 4:511+4);
imshow(uint8(imgRfil)); 




%hh = h'*h;
%or hh = h(:)*h;








