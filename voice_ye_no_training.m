%Peter Hoang and Kyuwon Kim
%EE241 Winter 2022, Voice Recognizer
%voice_ye_no_training.m
%voice_ye_no_training.m creates a histogram from a training bank of audio
%clips's feature score
clear all;clc;close all; 
for i = 0:99
    fileName = (strcat('train/no/',sprintf('%01d', i)));
    audioString = (fileName + ".wav")
    result(i+1, 1) = FeatureCalc(audioString);
end
subplot(2,1,1);
hist(result,50);
title("NO");

for i = 0:99
    fileName = (strcat('train/yes/',sprintf('%01d', i)));
    audioString = (fileName + ".wav");
    result(i+1, 1) = FeatureCalc(audioString);
end

subplot(2,1,2);
hist(result,50);
title("YES");