function [df] = gradient_Fraction(u,s)
    df = (s./(1+s*abs(u)).^2-s).*sign(u);
 return;