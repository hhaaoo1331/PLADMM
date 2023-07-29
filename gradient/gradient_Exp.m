function [df] = gradient_Exp(u,s)
     df = 1/s *(exp(-abs(u)/s)-1).*sign(u);
 return;