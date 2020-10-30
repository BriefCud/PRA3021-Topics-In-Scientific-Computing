%Run this file to get the answers to the DIY's

disp("These are the answers to the DIY's for the first Week of Topics in scientific computing");
choice = input("Press p then enter to continue. ", 's');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the Sampling DIY task");
%---- Answer to Sampling DIY task ----%

% Data for the Sampling DIY task 
% T = 2s time peroid
% v = 8Hz, first sampling frequency 
% v = 50Hz 

h = Sampling_Func(8,2,f); % At 8Hz
title('x vs f(t) with 8Hz sample frequency');
figure(2);
h_1 = Sampling_Func(50,2,f); %Sampling_Func('sampling frequency','time period','function')
title('x vs f(t) with 50Hz sample frequency');

%disp(h,h1);

%---- Answer to DFT, DIY 1 & 2 ---%

choice = input("Press p then enter to continue. ", 's');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the 1st & 2nd DIY task");
clf();
[a,b] = Dft_Func(x,pi); %Dft_Func('sampled data','time period')
title('discrete fourier transfrom for DIY 1');

%---- Answer to DFT, DIY 3 ---%

% Data for the DIY 3
% v = 16Hz, first ssampling frequency
% v = 50Hz
% First function, T = 1
% Second function, T = 1
% Third function, T = 2
% Fourth function, T = 2

choice = input("Press p then enter to continue. ", 's');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the 3rd DIY task at 16Hz");
clf();

o = Sampling_Func(16,1,f_1,1)';
title('discrete fourier transfrom for DIY 3 at 16Hzw, first equation');
figure(2);
h_3 = Sampling_Func(16,1,f_2,1);
title('discrete fourier transfrom for DIY 3 at 16Hz, second equation');
figure(3);
h_4 = Sampling_Func(16,1,f_3,1);
title('discrete fourier transfrom for DIY 3 at 16Hz, third equation');
figure(4);
h_5 = Sampling_Func(16,1,f_4,1);
title('discrete fourier transfrom for DIY 3 at 16Hz, fourth equation');

choice = input("Press p then enter to continue. ", 's');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the 3rd DIY task at 50Hz");
clf();

h_6 = Sampling_Func(50,1,f_1,1);
title('discrete fourier transfrom for DIY 3 at 50Hzw, first equation');
figure(2);
h_7 = Sampling_Func(50,1,f_2,1);
title('discrete fourier transfrom for DIY 3 at 50Hz, second equation');
figure(3);
h_8 = Sampling_Func(50,1,f_3,1);
title('discrete fourier transfrom for DIY 3 at 50Hz, third equation');
figure(4);
h_9 = Sampling_Func(50,1,f_4,1);
title('discrete fourier transfrom for DIY 3 at 50Hz, fourth equation');

%---- Answer for DFT DIY 4 ----%

choice = input("Press p then enter to continue. ", 's');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the 4th DIY task");
clf();

X = fft(x);
A = abs(X);
plot(A), xlabel('frequency'), ylabel('amplitude'), title('fast fourier transfrom for DIY 4');

%---- Answer for FFT DIY 1 ----%

choice = input("Press p then enter to continue. ", 's');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the FFT DIY");
clf();

z = rand(2^7,1);
q = ctfft(z);
disp(q);

%---- Answer for Finding Frequency conent ----%
% There are two ways to approach this, wither using the Dft_Func I have
% created already, or use the ctfft() function. The ctfft() algorithm
% cannot be used because the sample size needs to be an integer value of
% 2^n and the sample data given in signal.mat is not in the series 2^n.

% Using the equation v_s = N / T given in the powerpoint from week 1, I
% need the time period therefrore rearanging the equation gives T = N / v_s

choice = input("Press p then enter to continue.",'s');

while (choice ~= 'p')
    disp("Wrong key was pressed, please press the enter key to continue");
end
disp("These are the answers to the Finding the frequency content DIY task");
clf();

T = numel(x) / Fs;
[c,d] = Dft_Func(x,T);

%---- Answer for Beethoven ----%














