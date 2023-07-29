function [df] = gradient_Transformed_L1(u,s)
    df = ((s*(s+1))./(s+abs(u)).^2-(s+1)/s).*sign(u);
 return;