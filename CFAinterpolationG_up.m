function [imgG] = CFAinterpolationG_up(cfa)
%
% cfa RGGB pattern

[ row,col ] = size(cfa);
cfa = double(cfa);
imgG = zeros(row,col);
start = 1;

% RG -> even line
% GB -> odd line
% 0 g 0 g 0 g
% g 0 g 0 g 0
% 0 g 0 g 0 g
% g 0 g 0 g 0

for r=2:2:row-2
    for c=2:2:col-2
        imgG(r,c) = (cfa(r,c-1)+cfa(r,c+1)+cfa(r-1,c)+cfa(r+1,c))/4;
        imgG(r,c+1) = cfa(r,c+1);
        imgG(r+1,c) = cfa(r+1,c);
        imgG(r+1,c+1) = (cfa(r+1,c)+cfa(r+1,c+2)+cfa(r,c+1)+cfa(r+2,c+2))/4;
    end
end

for c=2:2:col-2
    imgG(start,c) = cfa(start,c);
    imgG(row,c) = (cfa(row,c-1)+cfa(row,c+1)+cfa(row-1,c))/3;
end

for c=3:2:col-1
    imgG(start,c) = (cfa(start,c-1)+cfa(start,c+1)+cfa(start+1,c))/3;
    imgG(row,c) = cfa(row,c);
end

for r=2:2:row-2
    imgG(r,start) = cfa(r,start);
    imgG(r,col) = (cfa(r-1,col)+cfa(r+1,col)+cfa(r,col-1))/3;
end

for r=3:2:row-1
    imgG(r,start) = (cfa(r-1,start)+cfa(r+1,start)+cfa(r,start+1))/3;
    imgG(r,col) = cfa(r,col);
end

imgG(start,start) = (cfa(start+1,start)+cfa(start,start+1))/2;
imgG(start,col) = cfa(start,col);
imgG(row,start) = cfa(row,start);
imgG(row,col) = (cfa(row-1,col)+cfa(row,col-1))/2;

imgG = uint8(imgG);
