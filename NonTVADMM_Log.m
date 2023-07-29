  function [U,PSNR,SNR,SSIM,i,f,t] = NonTVADMM_Log(I,F,H,maxit,mu,s,beta1,beta2,rho,gamma)
%  consider nonconvex function data fidelity term and TV regularization
% term, and convert a nonsmooth function into a smooth function by adding
% a term. We using DC to solve. The model is as follows:
%
% Solves
%           min_{u} mu*f(Ku-f)+\|Du\|_2        
%    
% f(t) = 1/s * log(1+s*abs(t))
%=============================================================

%% Input
% H -------------------- convolution kernel representing K
% F -------------------- blurry and noise observation
% maxit ----------- represents the maximum number of iteration steps 
% mu ---------------------- Regular parameters in the model
% s ------------------------  Parameters in non-convex functions
% rho ---------------------  proximal terms parameters
% beta1, beta2 -------------  Penalty parameter in ADMM
% gamma --------------------  Relaxation parameter in ADMM


%% Out 
% U ----------------------  Restore image data
% IPSNR, ISNR, ISSIM----------- Value of evaluation indicators after noise
% PSNR, SNR, SSIM------------ Value of evaluation indicators after recovery
% i ------------------- The number of steps required for iteration outside the algorithm
% f -------------------- energy function values 
% t -------------------- cpu times
%% initialization
[m,n] = size(F);
C = getC(F,H); 
[D,Dt] = defDDt;
U = F;
Lam1 = zeros(m,n);
Lam2 = zeros(m,n);
Lam3 = zeros(m,n);
X = zeros(m,n);
Y1 = zeros(m,n);
Y2 = zeros(m,n); 
Denom = beta1 .* C.eigsKtK + beta2 .* C.eigsDtD + rho .* C.proI;
tic;
t0 = clock;
%% Algorithm ADMM
for i = 1 : maxit
     %  U-subprolem
     Up = U;
     KUF = imfilter(Up,H,'circular','conv') - F;
     df = gradient_Log(KUF,s);
     df = imfilter(df,H,'circular','corr');
     TKXL = beta1*X - Lam1;
     TKXL = imfilter(TKXL,H,'circular','corr');
     TKF = beta1*F;
     TKF = imfilter(TKF,H,'circular','corr');
     TDYL = Dt(beta2*Y1 - Lam2, beta2*Y2 - Lam3);
     U = TKXL + TKF + TDYL + rho*Up - mu*df;
     U = fft2(U)./Denom;
     U = real(ifft2(U));
   
     % X -subproblem
     KUF = imfilter(U,H,'circular','conv') - F;
     Log_c = 1;
     X = max(abs(KUF + Lam1/beta1) - (mu*Log_c)/beta1, 0).*sign(KUF + Lam1/beta1);
     
     %  Y -subprolem
     [D1U,D2U] = D(U);
     tvnorm = sqrt((D1U+Lam2/beta2).^2+(D2U+Lam3/beta2).^2);
     tvnorm(tvnorm==0) = 1;
     tvnorm = max(tvnorm-1/beta2,0)./tvnorm;
     Y1 = (D1U+Lam2/beta2).*tvnorm;
     Y2 = (D2U+Lam3/beta2).*tvnorm;

     %  Updating Lam
     Lam1 = Lam1 + gamma*beta1*(KUF-X);
     Lam2 = Lam2 + gamma*beta2*(D1U-Y1);
     Lam3 = Lam3 + gamma*beta2*(D2U-Y2);
      
     PSNR(i) = 10*(log10(size(I,1)*size(I,2))-log10(norm(I(:) - U(:))^2));
     SNR = 20*log10(norm(I(:))/norm(I(:) - U(:)));
     SSIM = ssim(I,U);
     f(i) = fval(D1U,D2U,KUF,s,mu);
     t(i)=etime(clock,t0); 
      
      if  norm(U-Up,'fro')/norm(Up,'fro') <= 1e-5
          break;
      end
    
end
return;
%%
function C = getC(F,H)

    [m,n] = size(F);

    C.eigsDtD = abs(psf2otf([1,-1],[m,n])).^2 + abs(psf2otf([1;-1],[m,n])).^2;
    C.eigsK = psf2otf(H,[m,n]);
    C.eigsKt = conj(C.eigsK);
    C.eigsKtK = abs(C.eigsK).^2;
    C.proI = abs(psf2otf([1],[m,n]));

return;

function [D,Dt] = defDDt

    D = @(U) ForwardD(U);
    Dt = @(X,Y) Dive(X,Y);

 return;

 function [Dux,Duy] = ForwardD(U)

        Dux = [diff(U,1,2), U(:,1) - U(:,end)];
        Duy = [diff(U,1,1); U(1,:) - U(end,:)];
 return;


 function DtXY = Dive(X,Y)

        DtXY = [X(:,end) - X(:, 1), -diff(X,1,2)];
        DtXY = DtXY + [Y(end,:) - Y(1, :); -diff(Y,1,1)];
 return;


 
 function [f] = fval(D1U,D2U,KUF,s,mu)
       tv = sum(sum(sqrt(D1U.^2 + D2U.^2)));
       fid = 1/s * log(1+s*abs(KUF));
       fid = sum(sum(fid));
       f = tv + mu*fid;
 return;
 

