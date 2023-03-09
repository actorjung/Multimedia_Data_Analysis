% image lab : image read/display/write

% image loading
fhead = 'lena'; %파일 헤더
fext = 'png'; %파일 익스팅션 PNG file 

filename = sprintf('%s.%s', fhead, fext);

img = imread(filename);
[row, col, dep] = size(img);

%image display
figure(1);
imshow(img);

%Draw a horizontal line on the image
color = [0, 255, 0]; %green
stpos = [100,200]; % x축값, y축값
linelen = 150;

img(stpos(1), stpos(2):stpos(2)+linelen-1, 1) = color(1); % R-plane
img(stpos(1), stpos(2):stpos(2)+linelen-1, 2) = color(2); % G-plane
img(stpos(1), stpos(2):stpos(2)+linelen-1, 3) = color(3); % B-plane

%vertical line
img(stpos(1):stpos(1)+linelen-1, stpos(2),1) = color(1); % R-plane
img(stpos(1):stpos(1)+linelen-1, stpos(2), 2) = color(2); % G-plane
img(stpos(1):stpos(1)+linelen-1, stpos(2), 3) = color(3); % B-plane


% img(100,200:200+150-1,1) = color(1); % R-plane
% img(100,200:200+150-1,2) = color(2); % G-plane
% img(100,200:200+150-1,3) = color(3); % B-plane

% Draw a Box
color = [255, 255, 0]; %Yellow
pos = [100,100]; % x축값, y축값
boxsize = [50,50];

imgY = DrawBox(img,pos,boxsize,color);

for n=1:5
    imgY = DrawBox(imgY, pos, boxsize+n*30, color);
end

figure(2);
imshow(imgY);

fext = 'jpg';
filenameout =sprintf('%s_box.%s',fhead,fext);
imwrite(imgY,filenameout);




