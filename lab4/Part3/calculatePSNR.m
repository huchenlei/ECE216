function [PSNR] = calculatePSNR(testSignal,compressedTestSignal)
    [M,N] = size(testSignal);
    MSE = (1/(M*N))*sum(sum((abs(testSignal-compressedTestSignal)).^2));
    PSNR = 10*log10(1/MSE);
end