image    = imread('C:\Users\akpin\Desktop\Image Processing\Matlab Fotoğrafları\\wood-dowels.tif');
figure(1), imshow(image), title('Original'); % to show original the image

B=bitget(image,1); figure(2), % to get bits of the image
subplot(2,4,1);imshow(logical(B));title('Bit plane 1');
B=bitget(image,2); subplot(2,4,2);imshow(logical(B));title('Bit plane 2');
B=bitget(image,3); subplot(2,4,3);imshow(logical(B));title('Bit plane 3');
B=bitget(image,4); subplot(2,4,4);imshow(logical(B));title('Bit plane 4');
B=bitget(image,5); subplot(2,4,5);imshow(logical(B));title('Bit plane 5');
B=bitget(image,6); subplot(2,4,6);imshow(logical(B));title('Bit plane 6');
B=bitget(image,7); subplot(2,4,7);imshow(logical(B));title('Bit plane 7');
B=bitget(image,8); subplot(2,4,8);imshow(logical(B));title('Bit plane 8');

rotimage = imrotate( image, 90 , 'loose', 'bilinear'); % to rotate the image
figure(3), imshow(rotimage), title('Rotated');

enlargimage  = imresize(image, 1.5, 'nearest'); % to increase size of the image
figure(4), imshow(enlargimage), title('Resized');

image2 = graythresh(enlargimage); 
BW     = im2bw(enlargimage, image2); %to do b&w 
figure(5), imshow(BW), title('B&W');


doubimage    = im2double(enlargimage); % to trans to double variable
doubimagenew = doubimage > 0.48 & doubimage < 1; %interval of thresholding value
figure(6) , imshow(doubimagenew), title('New Threshold')

fillimage = imfill(BW , 'holes');
figure(7) , imshow(fillimage), title('Filled');

[L num ]= bwlabeln(fillimage); 
imtool(L ,[]);

[M N]   = size(BW);
for i = 1: M
    for j= 1: N
        if L(i,j) ~= 199 & L(i,j)~=428 %to remove the largest and the second largest dowel
            fillimage(i,j)=0;
        end
    end
end
subplot(1,2,1), imshow(doubimage);
justimage= fillimage.*doubimage; % element wise 
subplot(1,2,2), imshow(justimage); % to compare both of two images

