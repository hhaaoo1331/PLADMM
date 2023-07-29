close all;
clear;
clc;

path(path,'./images');
path(path,'./gradient')
I = double(imread('Cameraman.tif'))/255; 
H = fspecial('average',9);
Level = 0.1;
B = imfilter(I,H,'circular','conv');
Bn = imnoise(B,'salt & pepper',Level);

%%
maxit = 20;
imaxit = 600;
mu = [100];
rho = 1e-5;
beta1 = [100000];
beta2 = 5;
gamma = 1.618;
s = 90;

%% image denoise
U = cell(length(mu),length(s),length(beta1),length(beta2));
PSNR = zeros(length(mu),length(s),length(beta1),length(beta2));
 for i = 1 : length(mu)
     for j = 1 : length(s)
         for k = 1 : length(beta1)
             for m = 1 : length(beta2)
         tic 
         [U{i,j,k,m},PSNR(i,j,k,m),SNR,SSIM,ii,Allmaxit] = NonconvexTVPLM(I,Bn,H,maxit,imaxit,mu(i),s(j),beta1(k),beta2(m),rho,gamma);
         t = toc; 
             end
         end
     end
 end

 ss = size(PSNR);
 maxsnr = max(max(max(max(PSNR))));
 Lax = find(PSNR>=maxsnr);
 [o,p,q,r] = ind2sub(ss,Lax);
 Loc_ax = [o,p,q,r];

figure(1);
subplot(131); imshow(I,[]);                                                                                              
subplot(132); imshow(Bn,[]);
subplot(133); imshow(U{i,j,k,m},[]);

% % image denoise
% 
% tic
% [U,PSNR,SNR,SSIM,ii,Allmaxit] = NonconvexTVPLM(I,F,H,maxit,imaxit,mu,s,alpha1,alpha2,rho,gamma);
% t=toc;
% 
% figure(1);
% subplot(131); imshow(I,[]);
% subplot(132); imshow(Bn,[]);
% subplot(133); imshow(U,[]);