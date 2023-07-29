function fid =MC_function(KUF,s)
     if abs(KUF) > 1/s
         fid = 1/(2*s);
     else
         fid = abs(KUF)-s/2*KUF.^2;
     end
 return;