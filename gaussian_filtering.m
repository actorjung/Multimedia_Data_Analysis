 %Gaussian Filtering Test
 fname = 'fruits.png';
 img = imread(fname);
  
 filter = ones(3,3)./9; 
 [m,n] = size(filter);

 %Add noise
 imgN = imnoise(img,"gaussian",0,0.5);
 figure(2); imshow(imgN);

 psnr_n = psnr(img,imgN)

%Remove noise    %%위너필터
dep = size(imgN, 3);
imgR = imgN;
for k = 1 : 3
   imgR(:,:,k) = wiener2(imgN(:,:,k));
end

 figure(3); imshow(imgR);
 psnr_r = psnr(img,imgR)
