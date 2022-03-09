function result = voice_ye_no_training(audioString)  
   [samples,sampleRate] = audioread(audioString); %(1)
   N =1024;%(2)
   numOfWindows = length(samples) / N; %(3)
   numOfWindows = floor(numOfWindows);
   samplePointer = 1;
   result = zeros(N/2,1);


    N = length(samples);
    Fs = sampleRate;
    low = round(N*4000/Fs);
    high = round(N*8000/Fs);
    
    shiftx = abs(fft(samples));
    

    result = sum(shiftx(1:low))/sum(shiftx(low:high));

