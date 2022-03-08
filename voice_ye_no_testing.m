clear all;clc;close all; 
function result = voice_recognition(x, Fs)
%threshold = ?; threshold has to be determined based on lo/hi ratio

N = length(x);
low = round(N*4000/Fs);
high = round(N*8000/Fs);

shiftx = abs(fft(x));
feature = sum(shiftx(1:low))/sum(shiftx(low:high));

if featrue < threshold
    result = 'yes';
else
    result = 'no';
end 