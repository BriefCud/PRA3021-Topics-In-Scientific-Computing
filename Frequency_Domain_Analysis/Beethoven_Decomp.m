function b = Beethoven_Decomp()
    % I compressed the file because the matrix of 'y' from the origional
    % file was too large
    [y,v_s] = audioread('beethoven_5th_sample_comp.wav');
    
    % Using this function I can find the necessary information about the 
    % .wav file such as its duration, sample frequecy, etc.
    info = audioinfo('beethoven_5th_sample.wav')';
    T = 6.7231; % Total time of the sample
    
    plot(y);
    
    figure(2);
    Dft_Func(y,T);
    
    % Using the inbuilt fft algorithm rather then my own dft algorithm. 
%     g = fft(y);
%     A = abs(g);
%     figure(2)
%     plot(A)

    % Applying the filter to take out noise
    n = 5;
    start_freq = 700 / (v_s/2);
    end_freq = 4000 / (v_s/2);
    [b,a] = butter(n,[start_freq,end_freq],'bandpass');
    out = filter(b,a,y);
    figure(3);
    plot(out);
end