function [compressionRate] = calculateCompressionRate( M, N, numDiscardedCoeficients )
    %64 + 64 bits per complex fourier coeficient of type double
    originalSize = 128*M*N;
    
    newSize = 128*(M*N - numDiscardedCoeficients) + ceil(numDiscardedCoeficients*log2(M*N)) + ceil(log2(M*N));
    
    compressionRate = newSize/originalSize;
end