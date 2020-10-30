function h = Sampling_Func(v,T,m,d)
    
    if ~exist('d','var')
         % If fourth parameter doesn't exist set it to a default value
          d = 0;
    end
    
    N = T * v; % Calculates the number of samples at a specific frequency
    t = (0:N - 1)/N * T; % Calculates the sample times
    
           
    if (d == 1)
        
        %data = zeros(1:N);
        for i = 1:N
            data(i) = m(t(i));    
        end
        [a,b] = Dft_Func(data,T);
        [h] = [a,b];
        
    elseif (d == 0)
        % Plotting the sampled data
        h = plot_graph(m,0,T,t,d);
        xlabel('time'), ylabel('f(t)');
    else
        err = "incorrect parameter 'd', must be null, 0 or 1";
        error(err);
    end
end 





