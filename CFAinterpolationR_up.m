function [imgR] = CFAinterpolationR_up(cfa)
%
% cfa RGGB pattern

[ row,col ] = size(cfa);
cfa = double(cfa);
imgR = zeros(row,col);

% RG -> even line
% GB -> odd line
% r 0 r 0 r 0
% 0 0 0 0 0 0
% r 0 r 0 r 0
% 0 0 0 0 0 0

for r=1:2:row-2
    for c=1:2:col-2
        imgR(r,c) = cfa(r,c);
        imgR(r,c+1) = (cfa(r,c)+cfa(r,c+2))/2;
        imgR(r+1,c) = (cfa(r,c)+cfa(r+2,c))/2;
        imgR(r+1,c+1) = (cfa(r,c)+cfa(r,c+2)+cfa(r+2,c)+cfa(r+2,c+2))/4;
    end
end


%가장자리 보간법 끝에서 2번째 줄 
for c = 2 : 2 : col-2
    imgR(row-1,c-1) = cfa(row-1,c-1);
    imgR(row-1,c) = (cfa(row-1,c-1) + cfa(row-1,c+1))/2;
end

for r= 2 : 2 : row-2
    imgR(r-1,col-1) = cfa(r-1,col-1);
    imgR(r,col-1) = (cfa(r-1,col-1)+cfa(r+1,col-1))/2;

end

%가장자리 보간법 끝에서 1번째 줄 
for c = 1 : 2 : col-1
    imgR(row,c) = cfa(row-1,c);
end

for r= 1 : 2 : row-1
    imgR(r,col) = cfa(r,col-1);
end

for c = 2 : 2 : col-2
    imgR(row,c) = (cfa(row-1,c-1)+cfa(row-1,c+1))/2;
end

for r = 2 : 2 : row-2
    imgR(r,col) = (cfa(r-1,col-1)+cfa(r+1,col-1))/2;

end
 
imgR(row-1,col-1) = cfa(row-1,col-1);
imgR(row,col) = cfa(row-1,col-1);



imgR = uint8(imgR);