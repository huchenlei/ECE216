clear all
close all
clc

%import and format the test signal for use
testSignal = imread('testImageSmall.JPG');
testSignal = double(rgb2gray(testSignal))./255;

[M,N] = size(testSignal);

transformedSignal = fft2(testSignal);

coeficients = transformedSignal(:);
coeficientsModulus = abs(coeficients);
[~,sortedIndices] = sort(coeficientsModulus,'descend');

reconstructedSignal = zeros(M,N) + 1i * zeros(M,N);
reconstructedSignal2 = zeros(M,N) + 1i * zeros(M,N);

rowIndices = diag(linspace(0,M-1,M))*ones(M, N);
columnIndices = ones(M, N)*diag(linspace(0,N-1,N));

for i = 1:M*N
    
    %These statements are entirely for the purpose of
    %making illustrative breakpoints
    %PRESS CTRL + C AT ANY TIME TO STOP THE PROGRAM!
    
    pause(0.001);
    if(50 == i)
       breakPoint = 1;
    elseif(300 == i)
        breakPoint = 1;
    elseif(7000 == i)
        breakPoint = 1;
    end
    
    %get the frequency indicies for the basis vectors to be added this round
    f1Index = mod(sortedIndices(i)-1,M);
    f2Index = floor((sortedIndices(i)-1)/M);
    f1Index2 = mod(i-1,M);
    f2Index2 = floor((i-1)/M);
    
    %add the basis vectors witht the normalizing constant


    basisVector = exp(2*pi*1i.*((f1Index/M).*rowIndices + (f2Index/N).*columnIndices));
    reconstructedSignal = reconstructedSignal + (1/(M*N)).*transformedSignal(f1Index+1, f2Index+1) .* basisVector;

    basisVector = exp(2*pi*1i.*((f1Index2/M).*rowIndices + (f2Index2/N).*columnIndices));
    reconstructedSignal2 = reconstructedSignal2 + (1/(M*N)).*transformedSignal(f1Index2+1, f2Index2+1) .* basisVector;

    %calculate the mean squared error
    MSE = (1/(M*N))*sum(sum((abs(testSignal-real(reconstructedSignal))).^2));
    %pixels range between 0 and 1. Therefore peak power is 1
    psnrGraph(i) = 10*log10(1/MSE);
    indicesGraph(i) = i;

    MSE2 = (1/(M*N))*sum(sum((abs(testSignal-real(reconstructedSignal2))).^2));
    psnrGraph2(i) = 10*log10(1/MSE2);
    indicesGraph2(i) = i;
    
    %plot the curent results
    figure(1);
    subplot(2,1,1);
    imshow( [testSignal real(reconstructedSignal2) real(reconstructedSignal) ]);
    title({'Live Image Reconstruction','Original Image - Unsorted Reconstruction - Sorted Reconstruction'});
    subplot(2,1,2);
    plot(indicesGraph,psnrGraph2,indicesGraph,psnrGraph);
    title({'PSNR Comparison Between','Unsorted Reconstruction (Blue) and Sorted Reconstruction (Green)'});
    ylabel('PSNR (dB)');
    xlabel('Number of Fourier Basis Vectors in Reconstruction');
end
