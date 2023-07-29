function [df] = gradient_SCAD(u,s1,s2)
if abs(u)<=s1
    df = 0;
elseif abs(u)>s2 
    df = -sign(u);
else
    df = -(u - s1*sign(u))/(s2-s1);
end
return;