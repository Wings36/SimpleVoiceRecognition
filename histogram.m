clear;
for i = 0:99
    fileName = (strcat('train/no/',sprintf('%01d', i)));
    audioString = (fileName + ".wav")
    result(i+1, 1) = voice_ye_no_training(audioString)  
end

hist(result);
