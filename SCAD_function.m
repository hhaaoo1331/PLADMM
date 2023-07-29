function fid = SCAD_function(KUF,s1,s2)
if abs(KUF)<=s1
    fid = KUF;
elseif abs(KUF)>s2 
    fid = (s1+s2)/2;
else
    fid = (-KUF.^2+2*s2*abs(KUF)-s1^2)/(2*(s2-s1));
end
return;