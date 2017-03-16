clear all
close all
clc

%import and format the test signal for use
testSignal =zeros(60,60);
testSignal(26:35,26:35) = ones(10,10);

%-------------------------------------------------------------------------
%Write the DiscreteTimeFourierSeries2D function witch returns
%an M by N complex matrix that corresponds to the
%two dimensional fourier transform of the input matrix
%-------------------------------------------------------------------------

tic %The tic and toc commands are what give the execution time of your function
testSignalTransform = DiscreteTimeFourierSeries2D(testSignal);
toc

tic
fft2(testSignal);
toc

%check how close your DFT implementation is to Matlab's (No need to edit)
transformError = sqrt( sum( sum( abs( testSignalTransform - fft2(testSignal) ).^2) ) )


%make plot of image's transform (No need to edit)
transformDisplay = imag(testSignalTransform);
transformDisplay = transformDisplay - min(min(transformDisplay))*ones(size(transformDisplay));
transformDisplay = transformDisplay / max(max(transformDisplay));

figure(3);
displayComplexMatrixRealPartImage(transformDisplay);
title('Rectangle Function Transform Image');

figure(4);
displayComplexMatrixRealPartPlot(transformDisplay);
title('Rectangle Function Transform Surface Plot');
