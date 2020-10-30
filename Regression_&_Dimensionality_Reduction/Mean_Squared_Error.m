function MSE = Mean_Squared_Error(y,y_fit)

    N = numel(y);
    MSE = (1/N)*sum(y(:)-y_fit(:)).^2;

end