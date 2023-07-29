close all
load('Lena_a_Arctan.mat')
figure(1)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

% figure(2)
% plot([1:size(PSNR1,2)],PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
% hold on
% plot([1:size(PSNR2,2)],PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
% hold on
% plot([1:size(PSNR3,2)],PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
% hold on
% plot([1:size(PSNR4,2)],PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
% hold on
% plot([1:size(PSNR5,2)],PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
% hold on
% hl = legend('show');
% set(hl, 'interpreter', 'latex')
% xlabel({'Iteration'},'Interpreter','latex');
% ylabel({'PSNR'},'Interpreter','latex');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_ET.mat')
figure(2)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_Exp.mat')
figure(3)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_Fraction.mat')
figure(4)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_Log.mat')
figure(5)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_MC.mat')
figure(6)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_SCAD.mat')
figure(7)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_Smooth_Lp.mat')
figure(8)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Lena_a_Transformed_L1.mat')
figure(9)
plot(t1,PSNR1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,PSNR2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,PSNR3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,PSNR4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,PSNR5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'PSNR'},'Interpreter','latex');

