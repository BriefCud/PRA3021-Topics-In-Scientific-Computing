function q = ctfft(x)
% ~=
    x_even = []; % Declaring variables
    x_odd = [];
    N = numel(x);
    M = 0;
    if (N == 1)
        q = x;
    elseif (isinteger(uint32(log2(M))))
    % Checks if the logarithm of the length of the array 'x' with a base 2
    % is an integer value in the range 2^32, if it is then...
        M = N/2;
        % Using recursion to form an array of odd and even indexes. 
        % x(1:2:N) is x('start index':'step size':'end index').
        x_even = ctfft(x(1:2:N));  
        x_odd = ctfft(x(2:2:N));
        E = x_odd(1:M) .* exp(-2 * pi * 1i * (0:M-1) / N);
        x_k = x_even(1:M) + E;
        x_km = x_even(1:M) - E;
        q = [x_k,x_km];
        
    else
        err = ("Length of data array must be in the series 2^n when using the ctfft function");
        error(err)
    end
end