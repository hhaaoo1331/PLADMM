function [df] = gradient_ET(u,s)
     df = s*(exp(-s*abs(u))-1).*sign(u)/(1-exp(-s));
 return;