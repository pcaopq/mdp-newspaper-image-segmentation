clear,
clc
[HPOS VPOS WIDTH HEIGHT] = textread('test.txt', '%f %f %f %f\n');
num = size(HPOS(:,1));

for i=1:num
    if(HEIGHT(i) == 0)
        HEIGHT(i) = 200;
    end
end

 im = imread('0003.jp2');
 im = im2bw(im, 0.8);
 im = zeros(size(im));
 [h w] = size(im);
%im = zeros(2000,2000);
%im = im2bw(im, 0.8);

for i =1:num
    x = [VPOS(i) VPOS(i)+HEIGHT(i) VPOS(i)+HEIGHT(i) VPOS(i)];
    y = [HPOS(i) HPOS(i) HPOS(i)+WIDTH(i) HPOS(i)+WIDTH(i)];
    rectangle('position', [VPOS(i) HPOS(i)  WIDTH(i) HEIGHT(i) ], 'linewidth', 1);
%     fill(x,y,[1 1 1]);
%     im(ceil(7714/30796*(VPOS(i):VPOS(i)+HEIGHT(i))), ceil(7714/30796*(HPOS(i):HPOS(i)+WIDTH(i)))) = 1;
end
% figure,
% im = im(100:end-100, 100:end-170);
% im2 = imread('0003.jp2');
% im2 = im2(100:end-100, 100:end-170);
% im2 = im2bw(im2, 0.8);
% im = im-im2;
% imshow(im2);

%hough lines
% im = edge(im, 'canny');
% [H T R] = hough(im, 'RhoResolution',2,'Theta',0);

% [A idx] = sort(H(:,1),'descend');
% for i=1:50
%     line([R(idx(i)) R(idx(i))], [1 h], 'lineWidth', 1, 'Color', [0 0 1]);
% end

%draw blocks by open and close operations
%im = imresize(im, 0.1);

%if the background color is white
% im = ~im;
% 
% %imerode and imdilate
% 
% I4=imerode(im,strel('square',5));
% M1=imopen(I4,strel('square',4));         
% I5=imclose(M1,strel('square',4));  

% I6=imfill(~im,'holes');     
% im = imfill(im, 'holes');
% [L,P]=bwlabel(im);
% % [L, P] = bwlabel(im);
% imshow(~im);
% hold on,
% im2 = imread('0174.jp2');
% figure,
% imshow(im2);
% fileID = fopen('label.txt', 'w');
% for i=1:P
%     [r,c]=find(L==i);
%     a1=max(r);a2=min(r);
%     b1=max(c);b2=min(c);
%     w=b1-b2;h=a1-a2; 
%     rectangle('Position',[b2,a2,w,h],'LineWidth',2,'EdgeColor','b');
%     fprintf(fileID, '%d %d %d %d\n', [b2;a2;w;h]);   
%     hold on,
%     i
% end
% fclose(fileID);