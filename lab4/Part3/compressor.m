function [ numDiscardedCoefficients, compressedTestSignal ] = compressor(testSignal, cutoff)
    
    fourierCoefficients = fft2(testSignal); %Obtain the fourier series coefficients.
    
    %Loop through the fourier series coeficients. 
    [M,N] = size(testSignal);
    numDiscardedCoefficients = 0;
    for l = 0 : M-1 %loop through the row requencies
        for k = 0 : N-1 %loop through the column frequencies
            
            %If the absolute value of a coeficient is less than the cutoff 
            %parameter, set the coeficient to zero and increment the
            %numDiscardedCoeficients variable.
            
            %WRITE YOUR CODE HERE
            if abs(fourierCoefficients(l+1, k+1)) < cutoff
                fourierCoefficients(l+1, k+1) = 0;
                numDiscardedCoefficients = numDiscardedCoefficients + 1;
            end
        end
    end
    
    compressedTestSignal = ifft2(fourierCoefficients);
end
