%Peter Hoang and Kyuwon Kim
%EE241 Winter 2022, Voice Recognizer
%voice_ye_no_testing.m
%voice_ye_no_testing.m uses a test bank of audio clips and tests whether
%each clip is yes or no, and the accuracy of the voice recognizer.
clear all;clc;close all; 
total = 0;
correctYes = 0;
correctNo = 0;
threshold = 2;
for i = 100:170
    total = total + 1;
    fileName = (strcat('test/yes/',sprintf('%01d', 101))); %change folder name from no to yes
    audioString = (fileName + ".wav");

    feature = FeatureCalc(audioString);
    
    if feature < threshold
        result = 'yes';
        correctYes = correctYes + 1;
    else
     result = 'no';
     correctNo = correctNo + 1;
    end
    disp(result);
end
correctYesStat = correctYes/total * 100;

correctNo = 0;
correctYes = 0;
total = 0;


for i = 100:170
    total = total + 1;
    fileName = (strcat('test/no/',sprintf('%01d', 101))); %change folder name from no to yes
    audioString = (fileName + ".wav");
    feature = FeatureCalc(audioString);
    
    if feature < threshold
        result = 'yes';
        correctYes = correctYes + 1;
    else
     result = 'no';
     correctNo = correctNo + 1;
    end
    disp(result);
end
disp("Yes: " + correctYesStat+ "%");
disp("No: " + correctNo/total * 100 + "%");
