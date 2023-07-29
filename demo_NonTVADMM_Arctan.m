close all;
clear;
clc;

path(path,'./noise_data/');
% I = double(imread('Circle.png'))/255; 

% I = double(imread('parrot.png'))/255; 


%  I = double(imread('Shepp-Logan.png'))/255;

% H = 1;
%   H = fspecial('average',9);
% % % H = fspecial('gaussian',15,3);
% % % H = fspecial('disk',7);
%   Level = 0.3;
%   B = imfilter(I,H,'circular','conv');
% %  [Bn]=addnoise(B,Level,'rd');
%  Bn = imnoise(B,'salt & pepper',Level);
load('Lena_a_9.mat')
% load('Peppers_a_1.mat')
% load('Circular_a_1.mat')
% load('Shepp-Logan_a_3.mat')

%%
maxit = 2000;
mu = [30]; 
% mu = 20;
s =[20];
% s = 35;
 beta1= [2000];
% beta1 = 1000;
beta2= [200];   
rho = 1e-5;
gamma = 1.618;

%%image denoise

SNR = zeros(length(mu),length(s),length(beta1),length(beta2));
 for i = 1 : length(mu)
      for j = 1 : length(s)
          for k = 1 : length(beta1)
              for m = 1 : length(beta2)
              [U,PSNR,SNR(i,j,k,m),SSIM,ii,f,t] = NonTVADMM_Arctan(I,Bn,H,maxit,mu(i),s(j),beta1(k),beta2(m),rho,gamma);
              end
          end
      end
 end

 ss = size(SNR);
 maxsnr = max(max(max(max(SNR))));
 Lax = find(SNR>=maxsnr);
 [o,p,q,r] = ind2sub(ss,Lax);
 Loc_ax = [o,p,q,r];

figure(1);
subplot(131); imshow(I);                                                                                              
subplot(132); imshow(Bn);
subplot(133); imshow(U);


% figure(2);
% subplot(131); colormap gray, imagesc(I);                                                                                              
% subplot(132); colormap gray, imagesc(Bn);
% subplot(133); colormap gray, imagesc(U);
 
% %% image denoise
% 
% tic
% [U,PSNR,SNR,SSIM,i] = NonTVADMM(I,Bn,H,maxit,mu,s,beta1,beta2,rho,gamma);
% t=toc;
% 
% figure(1);
% subplot(131); imshow(I,[]);
% subplot(132); imshow(Bn,[]);
% subplot(133); imshow(U,[]);