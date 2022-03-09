clear all;clc;close all; 
[samples,sampleRate] = audioread("train\no\0.wav");
windowSize = 1024;
numOfWindows = size(samples) / windowSize;
numOfWindows = floor(numOfWindows);
numOfWindows = numOfWindows(1,1);
samplePointer = 1;
resultPSD = zeros(windowSize/2, 1);
ffshift = ((0:windowSize/2-1)*sampleRate/windowSize);
ffshift = rot90(ffshift);


for x = 1:numOfWindows
    windowSelect = samples(samplePointer:samplePointer + windowSize - 1);
    windowFFT = fftshift(fft(windowSelect));
    magWindow = abs(windowFFT) .^ 2;
    magWindow = magWindow + 0.001;
    %Converted to dB
    magWindow = 20 * log10(abs(magWindow));
    
    %discard bins corresponding to negative frequency components
    magWindow = magWindow(1:512);
    resultPSD = resultPSD + magWindow;

    %Advance pointer
    samplePointer = samplePointer + windowSize;
%     figure();
%     plot(ffshift,magWindow);
end
resultPSD = resultPSD ./ numOfWindows;
plot(ffshift, resultPSD);
