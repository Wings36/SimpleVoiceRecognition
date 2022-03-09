clear all;clc;close all; 
total = 0;
correctYes = 0;
correctNo = 0;
for i = 100:170
    total = total + 1;
    fileName = (strcat('test/no/',sprintf('%01d', 101))); %change folder name from no to yes
    audioString = (fileName + ".wav")
    [x, Fs] = audioread(audioString);
    threshold = 2;


    feature = voice_ye_no_training(audioString);
    
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
