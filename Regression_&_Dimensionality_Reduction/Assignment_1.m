function [ERR,out] = Assignment_1(path,type)
    
    %Read the csv file
    data = readmatrix(path);
    
    % Extarct the data
    x1 = data(:,1); x2 = data(:,2); x3 = data(:,3);
    X = [x1 x2 x3];
    
    y1 = data(:,6); y2 = data(:,7);
    Y = [y1 y2];
    
    % This loop calculates the correlation matrix for each combination of
    % x and y. Then the matrix is held in a 3D array for comparision. The
    % first two 'pages' of the R matrix are the x1 variable against y1 and
    % y2 respectivly. The correlation matrix is symmetrical, this means
    % that I can tell which combination has the strongest correlation. To
    % tell which has the strongest correlation, the numbers on either side 
    % of the 1.00 value must be close to +1 or -1 to have strong linear 
    % correlation, therefore I will choose that combination to perform the 
    % tasks  
    temp = 0;
    for i = 1:3
        for j = 1:2
            temp = temp +1;
            R(:,:,temp) = corrcov(cov(X(:,i),Y(:,j)));
        end
    end
    
    % The matrix R should output 6 'pages' of correlation matricies, of
    % which the first page and 4th page have the strongest correlation.
    % This means that the combination of x1 against y1 and x2 against y2
    % have the strongest correlation.
    R
    
    % Plot the data for the specific combination 
    figure; plot(X(:,1),Y(:,1),'.r');
    figure; plot(X(:,2),Y(:,2),'.r');
    
    if (type == 'l')
        % Using the built in linear regression to compare the results with my
        % method
        mdl_1 = fitlm(X(:,1),Y(:,1));
        mdl_2 = fitlm(X(:,2),Y(:,2));

        % Applying linear regression to find the model coefficients
        [theta_1,y_fit_1,R_sq_1] = Linear_Regression(X(:,1),Y(:,1));
        [theta_2,y_fit_2,R_sq_2] = Linear_Regression(X(:,2),Y(:,2));
        
        figure; plot(X(:,1),Y(:,1),'.r',X(:,1),y_fit_1,'.k');
        figure;plot(X(:,2),Y(:,2),'.r',X(:,2),y_fit_2,'.k');

        % Comparing the estimations. When this matrix is displayed I can see
        % that my coefficients are the same as the one produced by the inbuilt
        % function fitlm
        comp(:,:,1) = [mdl_1.Coefficients.Estimate theta_1([2 1])];
        comp(:,:,2) = [mdl_2.Coefficients.Estimate theta_2([2 1])];
        out = comp;
        
        R_sq = [R_sq_1(1,2);R_sq_2(1,2)];
        MSE_1 = immse(Y(:,1),y_fit_1);
        MSE_2 = immse(Y(:,2),y_fit_2);
        MSE = [MSE_1;MSE_2];
        
        % This columns of this matrix that holds the values for the mean 
        % squared error and R squared respectively and the row depicts
        % which dataset it it looking at.
        ERR = [MSE R_sq];
    
    elseif (type == 'p')
        
        % Polynomial Regression to fins the coeffecients
        % I had the third parameter in Polynomial_Regression as 10, which
        % indicates how many times the nested for loop will iterate. 10 was
        % too high a number because it was overfitting the curve so I
        % lowered it and to my surprise the curve was better fitted and the
        % R squared is much better.
        [theta_1,y_fit_1,R_sq_1] = Polynomial_Regression(X(:,1),Y(:,1),5);
        [theta_2,y_fit_2,R_sq_2] = Polynomial_Regression(X(:,2),Y(:,2),5);
        
        figure; plot(X(:,1),Y(:,1),'.r',X(:,1),y_fit_1,'.k');
        figure; plot(X(:,2),Y(:,2),'.r',X(:,2),y_fit_2,'.k');
        
        out = [theta_1 theta_2];
        
        R_sq = [R_sq_1(1,2);R_sq_2(1,2)];
        MSE_1 = immse(Y(:,1),y_fit_1);
        MSE_2 = immse(Y(:,2),y_fit_2);
        MSE = [MSE_1;MSE_2];
        
        ERR = [MSE R_sq];
        
    else
        disp("This option does not exist for the second parameter.");
        disp("Only l and p are allowed as parameters to Assignment_1()");
    end

end