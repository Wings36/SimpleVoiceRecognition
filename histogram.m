clear all;clc;close all; 
for i = 0:99
    fileName = (strcat('train/no/',sprintf('%01d', i)));
    audioString = (fileName + ".wav")
    result(i+1, 1) = voice_ye_no_training(audioString);
end
subplot(2,1,1);
hist(result,50);
title("NO");

for i = 0:99
    fileName = (strcat('train/yes/',sprintf('%01d', i)));
    audioString = (fileName + ".wav");
    result(i+1, 1) = voice_ye_no_training(audioString);
end

subplot(2,1,2);
hist(result,50);
title("YES");