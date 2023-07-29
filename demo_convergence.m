close all;
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


figure(2)
plot(t1,f1,'-.','LineWidth',1,'DisplayName','noise level: 10%'); 
hold on
plot(t2,f2,'-.','LineWidth',1,'DisplayName','noise level: 30%');   
hold on
plot(t3,f3,'-.','LineWidth',1,'DisplayName','noise level: 50%'); 
hold on
plot(t4,f4,'-.','LineWidth',1,'DisplayName','noise level: 70%');   
hold on
plot(t5,f5,'-.','LineWidth',1,'DisplayName','noise level: 90%'); 
hold on
hl = legend('show');
set(hl, 'interpreter', 'latex')
xlabel({'CPU time'},'Interpreter','latex');
ylabel({'Function Value'},'Interpreter','latex');
