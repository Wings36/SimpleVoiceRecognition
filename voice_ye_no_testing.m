% clear all;clc;close all; 
function result = voice_ye_no_testing(x, Fs)
threshold = 12;

N = length(x);
low = round(N*4000/Fs);
high = round(N*8000/Fs);

shiftx = abs(fft(x));
feature = sum(shiftx(1:low))/sum(shiftx(low:high));

if feature < threshold
    result = 'yes';
else
    result = 'no';
end 
