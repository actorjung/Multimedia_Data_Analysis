% image lab 05: upgrade Demosaicking ( CFA interpolation )
% CFA = RG RG RG
%       GB GB GB

clear;
clc;

% image loading
fhead = 'lena'; %파일 헤더
fext = 'png'; %파일 익스팅션 PNG file 
filename = sprintf('%s.%s', fhead, fext);
img = imread(filename);
filename = sprintf('%s_cfa.%s', fhead, fext);
cfa = imread(filename);
figure(1);
imshow(cfa);

%Split cfa into each spectrum
% pitch = [2,2];
% phpit = [0,0];
% imgD = samplingDown(cfa,pitch,phpit);
% cfaR = samplingUp(imgD,pitch,phpit);
% figure(2);
% imshow(cfaR);

[cfaR, cfaG, cfaB ] = CFASplit(cfa);
figure(2);
imshow([cfaR,cfaG, cfaB]);

%linear image interpolation for R/G/B component
imgR = CFAinterpolationR_up(cfaR);
imgG = CFAinterpolationG_up(cfaG);
imgB = CFAinterpolationB_up(cfaB);
figure(3);
imshow([imgR,imgG,imgB]);

%Comparison
imgRe = img;
imgRe(:,:,1) = imgR;
imgRe(:,:,2) = imgG;
imgRe(:,:,3) = imgB;
figure(4);
imshow([img,imgRe]);
%지퍼링 엣지부분에 많이 생김

%PSNR or SSIM Comparison
% cutsize = [2,2];
% imgRe = CutBoundary(imgRe,cutsize);
% img = CutBoundary(img,cutsize);

pval = psnr(imgRe,img,255);
sval = ssim(imgRe,img); %->코릴레이션과 비슷한 구조 얼마나 비슷한가
txt = sprintf('PSNR = %4.2fdB, SSIM - %4.3f',pval,sval);
disp(txt);

%psnr은 가장자리없는거에 많은 영향