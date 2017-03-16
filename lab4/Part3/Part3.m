clear all
close all
clc

%import and format the test signal for use
testSignal = imread('testImage.JPG');
testSignal = double(rgb2gray(testSignal))./255; %Make the image grayscale with pixel values between 0 and 1.

[M,N] = size(testSignal);

%Vary this cutoff parameter to explore the 
%compression rate to PSNR tradeoff
cutoff = 10;

%Create a function that compresses an image by zeroing out Fourier
%coeficients with a modulus below a cutoff threshold
[ numDiscardedCoeficients, compressedTestSignal ] = compressor(testSignal, cutoff);

%This function calculates the PSNR of the compressed image relative to the
%original image.
PSNR = calculatePSNR(testSignal,compressedTestSignal);

%This function approximates the the compression rate that is obtained.
compressionRate = calculateCompressionRate(M,N, numDiscardedCoeficients );

%Display the image and its compressed version.
figure(1);
imshow([testSignal compressedTestSignal]);
str = sprintf('PSNR = %.3fdB    R = %.3f',PSNR,compressionRate);
title(str);