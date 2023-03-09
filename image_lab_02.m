% image lab 02: image sampling

clear;
clc;

% image loading
fhead = 'lena'; %파일 헤더
fext = 'png'; %파일 익스팅션 PNG file 
filename = sprintf('%s.%s', fhead, fext);
img = imread(filename);
pnginf = imfinfo(filename);
filsize = pnginf.FileSize;
[row, col, dep] = size(img);


%image display
figure(1);
imshow(img);

% image down/up sampling
% down parameters
pitch = [2 , 2];
phpit = [1 , 0];
%imgD = img(phpit(1)+1:pitch(1):end , phpit(2)+1:pitch(2):end, :);
%imgD = img(1:2:end,1:2:end,:);
imgD = samplingDown(img,pitch,phpit);

figure(2);
imshow(imgD);


% up sampling
% [row, col, dep] = size(imgD);
% imgU = uint8(zeros(row*pitch(1), col*pitch(2), dep));
% imgU(phpit(1)+1:pitch(1):end , phpit(2)+1:pitch(2):end, :) = imgD;
imgU = samplingUp(imgD,pitch,phpit);


figure(3);
imshow(imgU);






