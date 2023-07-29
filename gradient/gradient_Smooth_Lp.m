function [df] = gradient_Smooth_Lp(u,p,r)
    df = p*((abs(u)+r).^(p-1)-r^(p-1)).*sign(u);
 return;