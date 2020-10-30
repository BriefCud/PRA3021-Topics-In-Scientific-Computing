function out = lr_test()
%LINEAR_REGRESSION Summary of this function goes here
%   Detailed explanation goes here

    % Creating random points out a linear polynomial y = 3x + 7 
    c = [3 7];
    x = randn(1,1000);
    y = c(1)*x + c(2) + randn(size(x));
    
    % Plotting a graph
%     out = scatter(x,y,'x');
    
    % Creating a matrix the holds info about the data
    A = [x(:),ones(numel(x),1)];
    
    % Calculating an estimate for theta
    theta = A\y';
    
    % Comparing rhe calculated coefficients with the origonal ones
    out = [c(:),theta];
    
    % Geerating the new y coordinates using theta
    y_fit = A*theta;
    
    plot(x,y,'.r',x,y_fit,'.k');
    
    % Applying Interpolation
    xint = 1;
    yint = [xint 1]*theta;
    hold on; plot(xint,yint,'.b','MarkerSize',20); hold off;
    
    % Predicting the value on the y axis for a value not in the dataset
    new_x = max(x) + 1;
    new_y = [new_x 1]*theta;
    hold on; plot(new_x,new_y,'.b','MarkerSize',20); hold off;
    
    % Computing R squared, to see how good of a fit I did
    R_sq = (1-sum((y(:)-y_fit(:)).^2))/sum((y(:)-mean(y(:))).^2)
    
end

