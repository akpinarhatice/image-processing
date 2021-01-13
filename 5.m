%%IMAGE PROCESSING HOMEWORK5
%%Name-Surname: Hatice AKPINAR
%%Number: 1621231013

%%
clc; clear all; close all;

%%
I = imread('C:\Users\akpin\Desktop\Image Processing\Matlab Fotoğrafları\circuitboard.tif');
figure(1), imshow(I , []);
%%
%Gaussian Noise
a = im2double(imnoise(I, 'gaussian', 0 , 0.5 ));
a = im2double(a);
[r,c] = size(a); si =1;

%gaussian-harmonic filter 
for i = 1:r
    for j = 1:c
        s1=0 ; con=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                   con = con+1;
                   if a(k1,p1)==0
                       s1 = s1+0;
                   else 
                       s1= s1+(1+a(k1,p1));
                   end
                end
            end
        end
        b2(i,j)=con/s1;
    end
end
figure(2), subplot(2,4,1), imshow(a, []), title('gaussian');
figure(2), subplot(2,4,2), imshow(b2),title('harmonic');

%gaussian-contraharmonic filter
indis=3;
for Q = [1 2 3]
    for i = 1:r
    for j = 1:c
        s1=0 ; s2=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                    s2 = s2 + (a(k1,p1)^(Q+1));
                     s1 = s1 + (a(k1,p1)^Q);
                end
            end
        end
        b1(i,j)=s2/s1;
    end
    end
    
    figure(2), subplot(2,4,indis), imshow(b1),title('contraharmonic');
    indis = indis+1;
end

%gaussian-alpha trimed filter
Q=0;
padedimg = zeros(433,602);
padedimg(2:r+1, 2:c+1)= a
mask = [1 1 1; 1 1 1; 1 1 1];
for i=2:r
    for j=2:c
        outimg(i-1,j-1)=mask(1,1)*padedimg(i-1,j-1)+mask(1,2)*padedimg(i-1,j)+mask(1,3)*padedimg(i-1,j+1)+mask(2,1)*padedimg(i,j-1)+ mask(2,2)*padedimg(i,j)+mask(2,3)*padedimg(i,j+1)+mask(3,1)*padedimg(i+1,j-1)+mask(3,2)*padedimg(i+1,j)+mask(3,3)*padedimg(i+1,j+1);
    end
end
figure(2), subplot(2,4,6), imshow(outimg, []),title('alpha trimmed');

%gaussian-median filter
gausmed = medfilt2(a, [5,5]);
figure(2), subplot(2,4,7), imshow(gausmed),title('median');

%gaussian-wiener filter
gauswien = wiener2(a);
figure(2), subplot(2,4,8), imshow(gauswien, []),title('wiener');


%%
%%Gaussian Noise2
b = imnoise(I, 'gaussian', 0 , 1 );
b = im2double(b);
[r,c] = size(b); 
%gaussian2-harmonic filter 
si =1; Q=0;
for i = 1:r
    for j = 1:c
        s1=0 ; con=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                   con = con+1;
                   if b(k1,p1)==0
                       s1 = s1+0;
                   else 
                       s1= s1+(1+b(k1,p1));
                   end
                end
            end
        end
        b2(i,j)=con/s1;
    end
end
figure(3), subplot(2,4,1), imshow(b),title('gaussian2');
figure(3), subplot(2,4,2), imshow(b2),title('harmonic');
%gaussian2-contraharmonic filter
indis = 3 ;
for Q = [1 2 3]
for i = 1:r
    for j = 1:c
        s1=0 ; s2=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                    s2 = s2 + (b(k1,p1)^(Q+1));
                     s1 = s1 + (b(k1,p1)^Q);
                end
            end
        end
        b1(i,j)=s2/s1;
    end
end
  figure(3), subplot(2,4,indis), imshow(b1, []),title('contraharmonic ');
    indis = indis+1;
end

%gaussian2-alpha trimed filter
padedimg = zeros(433,602);
padedimg(2:r+1, 2:c+1)= b
mask = [1 1 1; 1 1 1; 1 1 1];
for i=2:r
    for j=2:c
        outimg(i-1,j-1)=mask(1,1)*padedimg(i-1,j-1)+mask(1,2)*padedimg(i-1,j)+mask(1,3)*padedimg(i-1,j+1)+mask(2,1)*padedimg(i,j-1)+ mask(2,2)*padedimg(i,j)+mask(2,3)*padedimg(i,j+1)+mask(3,1)*padedimg(i+1,j-1)+mask(3,2)*padedimg(i+1,j)+mask(3,3)*padedimg(i+1,j+1);
    end
end 
figure(3), subplot(2,4,6), imshow(outimg, []),title('alpha trimmed');
%gaussian2-median filter
gausmed2 = medfilt2(b, [5,5]);
figure(3), subplot(2,4,7), imshow(gausmed2, []),title('median');
%gaussian2-wiener filter
gaus2wien = wiener2(b);
figure(3), subplot(2,4,8), imshow(gaus2wien, []),title('wiener');

psnr(im2uint8(a) , im2uint8(gausmed))

%%
%Poison Noise
z = imnoise(I, 'poisson');
[r,c] = size(z); 
%poisson-harmonic filter 
si =1; Q=0;
for i = 1:r
    for j = 1:c
        s1=0 ; con=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                   con = con+1;
                   if z(k1,p1)==0
                       s1 = s1+0;
                   else 
                       s1= s1+(1+z(k1,p1));
                   end
                end
            end
        end
        b2(i,j)=con/s1;
    end
end
figure(4), subplot(2,4,1), imshow(z, []),title('poisson');
figure(4), subplot(2,4,2), imshow(b2, []),title('harmonic');
%poisson-contraharmonic filter
indis=3;
for Q = [1 2 3]
for i = 1:r
    for j = 1:c
        s1=0 ; s2=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                    s2 = s2 + (z(k1,p1)^(Q+1));
                     s1 = s1 + (z(k1,p1)^Q);
                end
            end
        end
        b1(i,j)=s2/s1;
    end
end
  figure(4), subplot(2,4,indis), imshow(b1, []), title('contraharmonic');
    indis = indis+1;
end

%poisson-alpha trimed filter
padedimg = zeros(433,602);
padedimg(2:r+1, 2:c+1)= z
mask = [1 1 1; 1 1 1; 1 1 1];
for i=2:r
    for j=2:c
        outimg(i-1,j-1)=mask(1,1)*padedimg(i-1,j-1)+mask(1,2)*padedimg(i-1,j)+mask(1,3)*padedimg(i-1,j+1)+mask(2,1)*padedimg(i,j-1)+ mask(2,2)*padedimg(i,j)+mask(2,3)*padedimg(i,j+1)+mask(3,1)*padedimg(i+1,j-1)+mask(3,2)*padedimg(i+1,j)+mask(3,3)*padedimg(i+1,j+1);
    end
end 
figure(4), subplot(2,4,6), imshow(outimg, []),title('alpha trimmed');
%poisson-median filter
poismed2 = medfilt2(z, [5,5]);
figure(4), subplot(2,4,7), imshow(poismed2, []),title('median');
%poisson-wiener filter
poiswien = wiener2(z);
figure(4), subplot(2,4,8), imshow(poiswien, []),title('wiener');

%%
%Speckle Noise
d = imnoise(I, 'speckle' , 1);
[r,c] = size(d); 
%speckle-harmonic filter 
si =1; Q=0;
for i = 1:r
    for j = 1:c
        s1=0 ; con=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                   con = con+1;
                   if d(k1,p1)==0
                       s1 = s1+0;
                   else 
                       s1= s1+(1+d(k1,p1));
                   end
                end
            end
        end
        b2(i,j)=con/s1;
    end
end
figure(5), subplot(2,4,1), imshow(d, []),title('speckle');
figure(5), subplot(2,4,2), imshow(b2, []),title('harmonic');
%speckle-contraharmonic filter
indis=3;
for Q = [1 2 3]
for i = 1:r
    for j = 1:c
        s1=0 ; s2=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                    s2 = s2 + (d(k1,p1)^(Q+1));
                     s1 = s1 + (d(k1,p1)^Q);
                end
            end
        end
        b1(i,j)=s2/s1;
    end
end
figure(5), subplot(2,4,indis), imshow(b1, []),title('contraharmonic ');
    indis = indis+1;
end

%speckle-alpha trimed filter
padedimg = zeros(433,602);
padedimg(2:r+1, 2:c+1)= d
mask = [1 1 1; 1 1 1; 1 1 1];
for i=2:r
    for j=2:c
        outimg(i-1,j-1)=mask(1,1)*padedimg(i-1,j-1)+mask(1,2)*padedimg(i-1,j)+mask(1,3)*padedimg(i-1,j+1)+mask(2,1)*padedimg(i,j-1)+ mask(2,2)*padedimg(i,j)+mask(2,3)*padedimg(i,j+1)+mask(3,1)*padedimg(i+1,j-1)+mask(3,2)*padedimg(i+1,j)+mask(3,3)*padedimg(i+1,j+1);
    end
end 
figure(5), subplot(2,4,6), imshow(outimg, []),title('alpha trimmed');
%speckle-median filter
speckmed = medfilt2(d, [5,5]);
figure(5), subplot(2,4,7), imshow(speckmed, []),title('median');

%speckle-wiener filter
speckwien = wiener2(d);
figure(5), subplot(2,4,8), imshow(speckwien, []),title('wiener');

%%
%Salt&Pepper Noise
e = imnoise(I, 'salt & pepper', 0.3);
[r,c] = size(e); 
%salt&pepper-harmonic filter 
si =1; Q=0;
for i = 1:r
    for j = 1:c
        s1=0 ; con=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                   con = con+1;
                   if e(k1,p1)==0
                       s1 = s1+0;
                   else 
                       s1= s1+(1+e(k1,p1));
                   end
                end
            end
        end
        b2(i,j)=con/s1;
    end
end
figure(6), subplot(2,4,1), imshow(e, []),title('salt&pepper');
figure(6), subplot(2,4,2), imshow(b2, []),title('harmonic');
%salt&pepper-contraharmonic filter
indis = 3 ;
for Q = [1 2 3]
for i = 1:r
    for j = 1:c
        s1=0 ; s2=0;
        for k1= i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<r && p1<c))
                    s2 = s2 + (e(k1,p1)^(Q+1));
                     s1 = s1 + (e(k1,p1)^ Q );
                end
            end
        end
        b1(i,j)=s2/s1;
    end
end
figure(6), subplot(2,4,indis), imshow(b1, []), title('contraharmonic ');
    indis = indis+1;
end

%salt&pepper-alpha trimed filter
padedimg = zeros(433,602);
padedimg(2:r+1, 2:c+1)= e
mask = [1 1 1; 1 1 1; 1 1 1];
for i=2:r
    for j=2:c
        outimg(i-1,j-1)=mask(1,1)*padedimg(i-1,j-1)+mask(1,2)*padedimg(i-1,j)+mask(1,3)*padedimg(i-1,j+1)+mask(2,1)*padedimg(i,j-1)+ mask(2,2)*padedimg(i,j)+mask(2,3)*padedimg(i,j+1)+mask(3,1)*padedimg(i+1,j-1)+mask(3,2)*padedimg(i+1,j)+mask(3,3)*padedimg(i+1,j+1);
    end
end 
figure(6), subplot(2,4,6), imshow(outimg, []),title('alpha trimmed');

%salt&pepper-median filter
sapmed = medfilt2(e, [5,5]);
figure(6), subplot(2,4,7), imshow(sapmed, []), title('median');

%salt&pepper-wiener filter
sapwien= wiener2(e);
figure(6), subplot(2,4,8), imshow(sapwien, []), title('wiener');


%%
% %Part2
f = imread('C:\Users\akpin\Desktop\Image Processing\Matlab Fotoğrafları\astronaut-interference.tif');
f = im2double(f);
figure(7), imshow(f);
F = fft2(f);
Fc = fftshift(F);
S = abs(Fc);
imtool(S , []);
[r,c] = size(f);
mask = zeros(r,c);
for i = 1:r
    for j = 1:c
        k = sqrt(((i-1-r/2)^2 + (j-1-c/2)^2));
        if(k < 35)
            mask(i,j) = 255;
        else if(k > 36)
             mask(i,j) = 255;
        else
             mask(i,j) = 0;
        end
        end
    end
end
Fc = Fc.*mask;
Gs = ifftshift(Fc);
g = ifft2(Gs);
figure(8), imshow(g, []);


