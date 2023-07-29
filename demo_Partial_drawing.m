figure(1)
% I = imread('Circular_d_7_NTVADMM.png');
 load('Circular_a_6_NTVADMMET.mat');
U1 = U(84:93,74:83); 
figure1 = gcf;
ax1 = axes('Position',[0.1,0.1,0.8,0.8]); 
ax2 = axes('Position',[0.49,0.1,0.35,0.35]);
axes(ax1)
imshow(U)
rectangle('Position',[74,84,10,10],'Curvature',[0,0],'LineWidth',2,'EdgeColor','r');
axes(ax2)
imshow(U1)
grid on  

% figure(2)
% I = imread('Lena_d_5_NTVPLM.png');
% I1 = I(46:55,204:213); 
% figure2 = gcf;
% ax1 = axes('Position',[0.1,0.1,0.8,0.8]); 
% ax2 = axes('Position',[0.49,0.1,0.35,0.35]);
% axes(ax1)
% imshow(I)
% rectangle('Position',[204,46,10,10],'Curvature',[0,0],'LineWidth',2,'EdgeColor','r');
% axes(ax2)
% imshow(I1)
% grid on  
% 
% 
% figure(3)
% I = imread('Peppers_d_5_NTVADMM.png');
% I1 = I(40:49,75:84); 
% figure3 = gcf;
% ax1 = axes('Position',[0.1,0.1,0.8,0.8]); 
% ax2 = axes('Position',[0.49,0.1,0.35,0.35]);
% axes(ax1)
% imshow(I)
% rectangle('Position',[75,40,10,10],'Curvature',[0,0],'LineWidth',2,'EdgeColor','r');
% axes(ax2)
% imshow(I1)
% grid on  
% 
% figure(4)
% I = imread('Shepp-Logan_a_6_NTVADMM.png');
% I1 = I(121:130,211:220); 
% figure4 = gcf;
% ax1 = axes('Position',[0.1,0.1,0.8,0.8]); 
% ax2 = axes('Position',[0.49,0.1,0.35,0.35]);
% axes(ax1)
% imshow(I)
% rectangle('Position',[211,121,10,10],'Curvature',[0,0],'LineWidth',2,'EdgeColor','r');
% axes(ax2)
% imshow(I1)
% grid on  