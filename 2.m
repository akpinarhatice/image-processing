
%%IMAGE PROCESSING HOMEWORK2 
%%Name-Surname: Hatice AKPINAR
%%Number: 1621231013

%%
clc; clear all; close all;

%%
%%Define the picture (Stage 1)
lena = imread('C:\Users\akpin\Desktop\Image Processing\lena.tif');
aerial = imread('C:\Users\akpin\Desktop\Image Processing\aerial.tif');
aerial = im2double(aerial);
lena = im2double(lena);

%%
%Inverse image (Stage 2)
inverseLena = 1-lena; %lena inverse
inverseAerial = 1-aerial;
figure(1)
subplot(2,2,1), imshow(lena), title("Original Lena");
subplot(2,2,2), imshow(inverseLena), title("Inverse Lena");
subplot(2,2,3), imshow(aerial), title("Original Aerial");
subplot(2,2,4), imshow(inverseAerial), title("Inverse Aerial");

%%
%Thresholding transform (Stage 3)
threshLena =(lena > 0.35);%%thresholding
threshAerial =(aerial > 0.81);
figure(2);
subplot(2,1,1); imshow(threshLena);title("Thresholding lena");
subplot(2,1,2); imshow(threshAerial);title("thresholding aerial");

%%
%Gamma transform
    gammaThresh = @(C, A, gammaValue) C.* A .^gammaValue; %function handler (Stage 4)
    a=0, b=0, c=0;
    for C =[0.5]
             for  gammaValue =[ -1, -0.5, 0, 0.25, 0.50, 1, 2 ]
              a = a + 1;  
              if(a>7)
                  break
              end
              gLena= gammaThresh(C, lena, gammaValue);
                figure(3), subplot(2,4,a); imshow(gLena);  title(['gamma = ' num2str(gammaValue)]);
              gAerial= gammaThresh(C, aerial, gammaValue);
                figure(4), subplot(2,4,a); imshow(gAerial);  title(['gamma = ' num2str(gammaValue)]);
       end
    end
      for C =[ 1]
             for  gammaValue =[ -1, -0.5, 0, 0.25, 0.50, 1, 2 ]
             b= b + 1;  
              if(b>7)
                  break
              end
              gLena= gammaThresh(C, lena, gammaValue);
                figure(5), subplot(2,4,b); imshow(gLena);  title(['gamma = ' num2str(gammaValue)]);
              gAerial= gammaThresh(C, aerial, gammaValue);
                figure(6), subplot(2,4,b); imshow(gAerial);  title(['gamma = ' num2str(gammaValue)]);
       end
      end
      for C =[1.5]
             for  gammaValue =[ -1, -0.5, 0, 0.25, 0.50, 1, 2 ]
             c = c + 1;  
              if(c>7)
                  break
              end
              gLena= gammaThresh(C, lena, gammaValue);
                figure(7), subplot(2,4,c); imshow(gLena);  title(['gamma = ' num2str(gammaValue)]);
              gAerial= gammaThresh(C, aerial, gammaValue);
                figure(8), subplot(2,4,c); imshow(gAerial);  title(['gamma = ' num2str(gammaValue)]);
       end
    end
%%
%Log transmaformation (Stage 5)
e=0 , f=0;
for c = [1, 1.5]
 logTrans = @(c, r) c.*log10(1.5+ r);
 lenaLog= logTrans(c,lena);
 e=e+1,
 figure(9), subplot(1,2,e), imshow(lenaLog),title(['Log Transform C = ' num2str(c)]);
 
 aerialLog= logTrans(c,aerial);
 f=f+1,
 figure(10), subplot(1,2,f), imshow(aerialLog),title(['Log Transform C = ' num2str(c)]);
end

%%
%Piecewise transform for lena (Stage 6)
[row, col] = size(lena);
pieceLena = zeros(row , col);
pieceLena2 = zeros(row , col);
A=0.2, B=0.3, C=0.65, D=0.8, sbar1=0.5, sbar2=0.3 ;
for i = 1 : row
    for j = 1 : col
        pieceLena(i,j) = pieceTrans( lena(i,j) , A , B , sbar1 );
        pieceLena2(i,j)= pieceTrans( lena(i,j) , C , D , sbar2 );
    end
end
figure(11), imshowpair(  pieceLena,  pieceLena2, 'montage'), title("0.2<Lena<0.3 to 0.5 VS. 0.65<Lena<0.8 to 0.3 ");

%Piecewise line transform for aerial 
[row, col] = size(aerial);
pieceAerial = zeros(row , col);
pieceAerial2 = zeros(row , col);
A=0.2, B=0.3, C=0.65, D=0.8, sbar1=0.5, sbar2=0.3 ;
for i = 1 : row
    for j = 1 : col
        pieceAerial(i,j) = pieceTrans( aerial(i,j) , A , B , sbar1 );
        pieceAerial2(i,j)= pieceTrans( aerial(i,j) , C , D , sbar2 );
    end
end
figure(12), imshowpair( pieceAerial2, pieceAerial, 'montage'), title("0.2<Aerial<0.3 to 0.5 VS. 0.65<Aerial<0.8 to 0.3");

  
%%
%Piecewise Linear Transform (Stage 7)
[row,col] = size(lena);
lena_P = zeros(row , col);
lena_P = PieceLinTrans(0.2, 0.3, 0.65, 0.8, lena );
figure(13), imshow(lena_P), title("Piecewise Linear Transform Lena");
[row,col] = size(aerial);
aerial_P = zeros(row , col);
aerial_P = PieceLinTrans(0.2, 0.3, 0.65, 0.8, aerial );
figure(14), imshow(aerial_P), title("Piecewise Linear Transform Aerial");

%%
%Showing original images (Stage 8)
figure(15), subplot(1,2,1), imshow(lena), title("Lena Original");
           subplot(1,2,2), imshow(aerial), title("Aerial Original");
         














