function [theta,y_fit,R_sq] = Polynomial_Regression(x,y,k)

    % Step 1
    % Using AIC to find the optimal order of the polynomial
    for i = 1:k
        A = [];
        for j = 0:1:k-1
            A = [x.^j A];
        end
        
        theta = A\y;
        y_fit = A*theta;
        N = numel(y);
        
        aic(k) = N*log(sum((y(:)-y_fit(:)).^2)/N) + 2*k; 
     
    end
  
    % Calculating R Squared
    R_sq = corrcov(cov(y,y_fit));
    
end