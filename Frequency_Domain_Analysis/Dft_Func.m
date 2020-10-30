function [a,b] = Dft_Func(x,T,d)
% Function that computes the discrete fourier transform   
    if ~exist('d','var')
    % If fourth parameter doesn't exist set it to a default value
          d = 0;
    end

    N = numel(x);
    
    for k = 0:N
        s_a = 0;
        s_b = 0;
        for n=0:(N-1)
            s_a = s_a + x(n+1) * cos(2 * pi * k * n / N);
            s_b = s_b + x(n+1) * sin(2 * pi * k * n/N);
        end
    a(k+1) = s_a * 2/N;
    b(k+1)= s_b * 2/N;
    end
    
    if (d == 0)
    % Generates plot of the magnitude spectrum of x and shows
    % its frequency contents
        v_s = N/T;
        A = sqrt(a.^2+b.^2);
        K = length(A);
        v = (0:K-1)/N * v_s;
        plot_graph(v,A,0,0,1); 
        xlabel('frequency'), ylabel('amplitude)'), title('frequency vs amplitude');
end



