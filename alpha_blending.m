%alpha blending

img0 = imread("baboon.png");
img1 = imread("lena.png");

alpha = 0:0.1:1;
len = length(alpha);

for i = 1:len
    alp = alpha(i);
    img = (1-alp)*img0 + alp*img1;
    imshow([img0,img1,img]);
end



    



