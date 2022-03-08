clear all;clc;close all; 
[samples,sampleRate] = audioread("train\no\0.wav");
windowSize = 1024;
numOfWindows = size(samples) / windowSize;
numOfWindows = floor(numOfWindows);
numOfWindows = numOfWindows(1,1);
samplePointer = 1;
% PSD = 20*log10(abs()); %PSD function


for x = 1:numOfWindows
    windowSelect = samples(samplePointer:windowSize);
    windowFFT = fftshift(fft(windowSelect));
    magWindow = abs(windowFFT);

    %Converted to dB
    magWindow = 20 * log10(abs(magWindow));
    
    %discard bins corresponding to negative frequency components
    
end

