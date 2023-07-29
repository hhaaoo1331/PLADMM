 function [df] = gradient_MC(u,s)
     if abs(u) > 1/s
         df = -sign(u);
     else
         df = -s*u;
     end
 return;