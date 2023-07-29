function [U,PSNR,SNR,SSIM,i] = TVL1ADMM(I,F,H,maxit,mu,beta1,beta2,gamma)
%  consider nonconvex function data fidelity term and TV regularization
% term, and convert a nonsmooth function into a smooth function by adding
% a term. We using DC to solve. The model is as follows:
%
% Solves
%           min_{u} mu*\|Ku-f\|_{1}+\|Du\|_2        
%    

%=============================================================

%% Input
% H -------------------- convolution kernel representing K
% F -------------------- blurry and noise observation
% maxit ----------- represents the maximum number of iteration steps 
% mu ---------------------- Regular parameters in the model
% s ------------------------  Parameters in non-convex functions
% beta1, beta2 -------------  Penalty parameter in ADMM
% gamma --------------------  Relaxation parameter in ADMM


%% Out 
% U ----------------------  Restore image data
% IPSNR, ISNR, ISSIM----------- Value of evaluation indicators after noise
% PSNR, SNR, SSIM------------ Value of evaluation indicators after recovery
% i ------------------- The number of steps required for iteration outside the algorithm

%% initialization
[m,n] = size(F);
C = getC(F,H); 
[D,Dt] = defDDt;
U = F;
Lam1 = zeros(m,n);
Lam2 = zeros(m,n);
Lam3 = zeros(m,n);
KUF = imfilter(U,H,'circular','conv') - F;
[D1U,D2U] = D(U);
Demon = beta1*C.eigsKtK+beta2*C.eigsDtD;
%% Algorithm ADMM
for i = 1:maxit
    % X-subproblem
    X = max(abs(KUF+Lam1/beta1)-mu/beta1,0).*sign(KUF+Lam1/beta1);

    % Y-subproblem
    tv1 = D1U+Lam2/beta2;
    tv2 = D2U+Lam3/beta2;
    tvnorm = sqrt(tv1.^2+tv2.^2);
    tvnorm(tvnorm==0) = 1;
    tvnorm = max(tvnorm-1/beta2,0)./tvnorm;
    Y1 = tv1.*tvnorm;
    Y2 = tv2.*tvnorm;

    % U-subproblem
    Up = U;
    TKXL = beta1*X-Lam1;
    TKXL = imfilter(TKXL,H,'circular','corr');
    TKF = beta1*F;
    TKF = imfilter(TKF,H,'circular','corr');
    TDYL = Dt(beta2*Y1-Lam2,beta2*Y2-Lam3);
    U = TKXL+TKF+TDYL;
    U = fft2(U)./Demon;
    U = real(ifft2(U));

    % update Lam
    KUF = imfilter(U,H,'circular','conv')-F;
    [D1U,D2U] = D(U);
    Lam1 = Lam1+gamma*beta1*(KUF-X);
    Lam2 = Lam2+gamma*beta2*(D1U-Y1);
    Lam3 = Lam3+gamma*beta2*(D2U-Y2);

    PSNR = 10*(log10(size(I,1)*size(I,2))-log10(norm(I(:)-U(:))^2));
    SNR = 20*log10(norm(I(:))/norm(I(:)-U(:)));
    SSIM = ssim(I,U);
   

    if norm(U-Up,'fro')/norm(U,'fro')<=1e-4
        break
    end
end

%%
function C = getC(F,H)
    [m,n] = size(F);
    C.eigsDtD = abs(psf2otf([1,-1],[m,n])).^2 + abs(psf2otf([1;-1],[m,n])).^2;
    C.eigsK = psf2otf(H,[m,n]);
    C.eigsKt = conj(C.eigsK);
    C.eigsKtK = abs(C.eigsK).^2;
    C.proI = abs(psf2otf([1],[m,n]));
    C.KtF = real(ifft2(C.eigsKt .* fft2(F)));
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
 
%  function [f] = fval(D1U,D2U,KUF)
%        tv = sum(sum(sqrt(D1U.^2 + D2U.^2)));
%        fid = sum(sum(abs(KUF)));
%        f = tv + fid;
%  return;
%  

