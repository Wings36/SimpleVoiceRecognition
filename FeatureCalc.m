function result = FeatureCalc(audioString)  
   [samples,sampleRate] = audioread(audioString); %(1)
   N =1024;%(2)
   numOfWindows = length(samples) / N; %(3)
   numOfWindows = floor(numOfWindows);
   samplePointer = 1;
   fftTotal = zeros(N,1);

 
    Fs = sampleRate;
    low = round(N*4000/Fs);
    high = round(N*8000/Fs);

     for x = 1:numOfWindows
        windowSelect = samples(samplePointer: samplePointer + N - 1);
        windowFFT = abs(fft(windowSelect));

        fftTotal = fftTotal + windowFFT;
        
        for j=1:N %(5)
            if (windowFFT(j)==0) posWindow(j)=-60;
            else, posWindow(j) = 20*log10(windowFFT(j)); end
        end

        posWindow = posWindow(1:high);
        fftTotal = fftTotal + posWindow;

        
        samplePointer = samplePointer + N;        
      end %(7)

    aveDFT = windowFFT/numOfWindows; %(8)

    result = sum(aveDFT(1:low))/sum(aveDFT(low:high));



