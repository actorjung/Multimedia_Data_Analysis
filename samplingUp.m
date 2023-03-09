function [imgU] = samplingUp(img,pitch,phpit)
%[imgD] = samplingUp(img,pitch,phpit)
% e,g pitch = [2 , 2]; phapit = [0 , 0];
% image down/up sampling
% image up sampling

[row, col, dep] = size(img);
imgU = uint8(zeros(row*pitch(1), col*pitch(2), dep));
imgU(phpit(1)+1:pitch(1):end , phpit(2)+1:pitch(2):end, :) = img;
