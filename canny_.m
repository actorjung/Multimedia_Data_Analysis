 % canny edge detection Test

 % Read image
 
 fname = 'lena.png';
 img = imread(fname);
 figure(1); imshow(img);
 img = double(img);

 imgY = (img(:,:,1)+img(:,:,2)+img(:,:,3))/3;
 figure(2); imshow(imgY/255);

 %Canny edge 
 [imgbw,thres]  =  edge(imgY,"canny");
 figure(3); imshow(imgbw);

sigma = 5;
     imgbw = edge(imgY,"canny",thres,sigma);
     figure(4);
     imshow(imgbw);
    


%  for n = 1:10
%      sigma = 0.5*n;
%      imgbw = edge(imgY,"canny",thres,sigma);
%      figure(4);
%      imshow(imgbw);
%      pause();
% 
%  end




