 function [df] = gradient_Log(u,s)
     df = -s*u./(1+s*sign(u).*u);
 return;