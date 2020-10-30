function [theta,y_fit,R_sq] = Linear_Regression(x,y)

     A = [x,ones(numel(x),1)];
    theta = A\y;
    y_fit = A*theta;
    
    % Computing R squared
    R_sq = corrcov(cov(y,y_fit));
end