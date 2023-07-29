function [df] = gradient_Arctan(u,s)
    df = ((1./(s^2*u.^2+s*abs(u)+1))-1).*sign(u);
 return;