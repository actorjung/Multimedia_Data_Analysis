function[imgF] = imgFilterFreqMsk(img,imgmsk)
%
%

[row,col,dep] = size(img);

%imgF = img;
%or imgF = zeros(row,col,dep);

imgF = zeros(row,col,dep);

imgmsk = double(imgmsk)/255; %0-1 normalization

for k=1:dep
    imgF(:,:,k) = imgFilterFreqMskGray(img(:,:,k), imgmsk);
end

function imgF = imgFilterFreqMskGray(img,imgmsk)
%
%
imgft = fft2(img);
imgfts = fftshift(imgft);
imgtemp = imgfts.*imgmsk;
imgtemp = ifftshift(imgtemp);
imgF = ifft2(imgtemp);






