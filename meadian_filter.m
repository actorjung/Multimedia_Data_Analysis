 %Median Filterong Test
 fname = 'baboon.png';
 img = imread(fname);
 figure(1); imshow(img);

 %Add noise
 imgN = imnoise(img,"salt & pepper",0.1); 
 figure(2); imshow(imgN);

 psnr_n = psnr(img,imgN)

%Remove noise   
dep = size(imgN, 3);
imgR = imgN;
for k = 1 : 3
   imgR(:,:,k) = medfilt2(imgN(:,:,k),[5 5]);   %메디언 필터
end

 figure(3); imshow(imgR);
 psnr_r = psnr(img,imgR)










