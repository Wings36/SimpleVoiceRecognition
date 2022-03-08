clear all;clc;close all; 
[samples,sampleRate] = audioread("train\no\0.wav");
windowSize = 1024;
numOfWindows = samples / windowSize;
numOfWindows = floor(numOfWindows);
samplePointer = 1;

test = mat2cell(samples, windowSize);


% for x = 1:numOfWindows
%     
%     
% 
% 
% end