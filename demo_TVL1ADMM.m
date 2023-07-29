close all;
clear;
clc;

path(path,'./images');
path(path,'./gradient')
I = double(imread('Circle.png'))/255; 
H = fspecial('average',9);
Level = 0.3;
B = imfilter(I,H,'circular','conv');
Bn = imnoise(B,'salt & pepper',Level);

%%
maxit = 2000;
mu = [2];
beta1 = [100];
beta2 = [20];
gamma = 1.6180;

% %% image denoise
% 
% tic
% [U,PSNR,SNR,SSIM,ii] = TVL1ADMM(I,Bn,H,maxit,mu,beta1,beta2,gamma);
% t=toc;
% 
% figure(1);
% subplot(131); imshow(I,[]);
% subplot(132); imshow(Bn,[]);
% subplot(133); imshow(U,[]);

%% image denoise

PSNR = zeros(length(mu),length(beta1),length(beta2));
 for i = 1 : length(mu)
      for j = 1 : length(beta1)
          for k = 1 : length(beta2)
              tic 
              [U,PSNR(i,j,k),SNR,SSIM,ii] = TVL1ADMM(I,Bn,H,maxit,mu(i),beta1(j),beta2(k),gamma);
              t = toc;
          end
      end
 end

 ss = size(PSNR);
 maxpsnr = max(max(max(PSNR)));
 Lax = find(PSNR>=maxpsnr);
 [o,p,q] = ind2sub(ss,Lax);
 Loc_ax = [o,p,q];

figure(1);
subplot(131); imshow(I,[]);                                                                                              
subplot(132); imshow(Bn,[]);
subplot(133); imshow(U,[]);

