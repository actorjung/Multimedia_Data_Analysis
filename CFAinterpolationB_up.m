function [imgB] = CFAinterpolationB_up(cfa)
%
% cfa RGGB pattern

[ row,col ] = size(cfa);
cfa = double(cfa);
imgB = zeros(row,col);
start = 1;

% RG -> even line
% GB -> odd line
% 0 0 0 0 0 0 0
% 0 b 0 b 0 b 0
% 0 0 0 0 0 0 0
% 0 b 0 b 0 b 0


for r=2:2:row-2
    for c=2:2:col-2
        imgB(r,c) = cfa(r,c);
        imgB(r,c+1) = (cfa(r,c)+cfa(r,c+2))/2;
        imgB(r+1,c) = (cfa(r,c)+cfa(r+2,c))/2;
        imgB(r+1,c+1) = (cfa(r,c)+cfa(r,c+2)+cfa(r+2,c)+cfa(r+2,c+2))/4;
    end
end

%첫번째줄
for c = 2 : 2 : col-2 
    imgB(start,c) = cfa(start+1,c); 
end
for c = 3 : 2 : col-1
    imgB(start,c) = (cfa(start+1,c-1)+cfa(start+1,c+1))/2;
end
for r = 2 : 2 : row-2 
    imgB(r,start) = cfa(r,start+1); 
end
for r = 3 : 2 : row-1
    imgB(r,start) = (cfa(r-1,start+1)+cfa(r+1,start+1))/2;
end
%마지막줄
for c=2 : 2 : col
    imgB(row,c) = cfa(row,c); 
end
for c=3:2:col-1
    imgB(row,c) = (cfa(row,c-1)+cfa(row,c+1))/2;
end
imgB(row,start) = cfa(row,start+1);
for r=2 : 2 : row
    imgB(r,col) = cfa(r,col); 
end
for r=3:2:row-1
    imgB(r,col) = (cfa(r-1,col)+cfa(r+1,col))/2;
end
imgB(start,col) = cfa(start+1,col);
%첫번쨰 픽셀
imgB(start,start) = cfa(start+1,start+1);
imgB = uint8(imgB);