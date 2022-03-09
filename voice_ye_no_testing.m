% clear all;clc;close all; 
for i = 100:170
    fileName = (strcat('test/yes/',sprintf('%01d', i)));
    audioString = (fileName + ".wav")
    [x, Fs] = audioread(audioString);
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
    disp(result);
end
