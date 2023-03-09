% image lab 03: CFA sampling
% CFA = RG RG RG
%       GB GB GB

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

% R-plane sampling for RGGB CFA image
% R 0 R 0
% 0 0 0 0
pitch = [2,2];
phpit = [0,0];
imgD = samplingDown(img(:,:,1),pitch,phpit);
cfaR = samplingUp(imgD,pitch,phpit);


% B-plane sampling for RGGB CFA image
% 0 0 0 0
% 0 B 0 B
pitch = [2,2]; 
phpit = [1,1];
imgD = samplingDown(img(:,:,3),pitch,phpit);
cfaB = samplingUp(imgD,pitch,phpit);

%G1-plane sampling for RGRG CFA image
% 0 G 0 G
% 0 0 0 0
pitch = [2,2];
phpit = [0,1];
imgD = samplingDown(img(:,:,2),pitch,phpit);
cfaG1 = samplingUp(imgD,pitch,phpit);

%G2-plane sampling for RGGB CFA image
% 0 0 0 0
% G 0 G 0
pitch = [2,2];
phpit = [1,0];
imgD = samplingDown(img(:,:,2),pitch,phpit);
cfaG2 = samplingUp(imgD,pitch,phpit);
cfaG = cfaG1 + cfaG2;

figure(2);
imshow([cfaR,cfaG,cfaB]);

cfa = cfaR + cfaG + cfaB;
figure(3);
imshow(cfa); 

filename = sprintf('%s_cfa.%s', fhead, fext);
imwrite(cfa, filename);




