function result = voice_ye_no_training(audioString)  
    [samples,sampleRate] = audioread(audioString);
windowSize = 1024;
    numOfWindows = size(samples) / windowSize;
    numOfWindows = floor(numOfWindows);
    numOfWindows = numOfWindows(1,1);
    samplePointer = 1;
    resultPSD = zeros(windowSize/2, 1);
    ffshift = ((0:windowSize/2-1)*sampleRate/windowSize);
    ffshift = rot90(ffshift);
    
   for x = 1:numOfWindows
        windowSelect = samples(samplePointer:samplePointer + windowSize - 1);

        windowSize = length(windowSelect);
        windowFFT = fft(windowSelect);
        windowFFT = windowFFT(1:windowSize/2);
        magWindow = (1/(sampleRate*windowSize)) * abs(windowFFT) .^ 2;
        magWindow(2:end-1) = 2 * magWindow(2:end-1);
        magWindow = 10 * log10(magWindow);
        resultPSD = resultPSD + magWindow;
    
        %Advance pointer
        samplePointer = samplePointer + windowSize;
%         figure();
%         plot(ffshift,magWindow);
    end
    resultPSD = resultPSD ./ numOfWindows;
%     plot(ffshift, resultPSD);
    
    lowFeature = resultPSD(1:windowSize/4);
    lowFeature = sum(abs(lowFeature));
    highFeature = resultPSD((windowSize/4)+1:windowSize/2);
    highFeature = sum(abs(highFeature));
    result = lowFeature / highFeature;