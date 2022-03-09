clear all;clc;close all; 
total = 0;
correctYes = 0;
correctNo = 0;
for i = 100:170
    total = total + 1;
    fileName = (strcat('test/no/',sprintf('%01d', 101))); %change folder name from no to yes
    audioString = (fileName + ".wav")
    [x, Fs] = audioread(audioString);
    threshold = 12;

    ffshift = ((0:length(x)-1)*Fs/length(x));

    N = length(x);
    low = round(N*4000/Fs);
    high = round(N*8000/Fs);
    
    shiftx = abs(fft(x));

    feature = sum(shiftx(1:low))/sum(shiftx(low:high));
    
    if feature < threshold
        result = 'yes';
        correctYes = correctYes + 1;
    else
     result = 'no';
     correctNo = correctNo + 1;
    end
    disp(result);
end
disp(correctYes/total);
disp(correctNo/total);
