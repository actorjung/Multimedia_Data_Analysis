function [imgC] = CutBoundary(img,cutsize)
% cutsize= [2,2]
%

cr = cutsize(1);
cc = cutsize(2);

imgC = img(1+cr:end-cr, 1+cc:end-cc, :);
