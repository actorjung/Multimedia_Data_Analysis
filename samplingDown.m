function [imgD] = samplingDown(img,pitch,phpit)
%[imgD] = samplingDown(img,pitch,phpit)
% e,g pitch = [2 , 2]; phapit = [0 , 0];

% image down/up sampling
% down parameters
imgD = img(phpit(1)+1:pitch(1):end , phpit(2)+1:pitch(2):end, :);