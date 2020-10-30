function [result,V,D] = MyPCA(data)

    % Extracting the size of the data
    [M N] = size(data);

    % Calculate the mean of each column
    for i = 1:N
        % Creating a logical array that shows the positions of non NaN
        % values in the dataset
        T = ~isnan(data(:,i));
        % Put the column of interest in a temporary variable
        temp = data(:,i);
        % Calculate the mean of the column excluding the NaN values
        mean_arr(i) = mean(temp(T));
    end

    % Subtracting the mean away from every value for the corresponding column
    new_data = data - mean_arr;

    % Creating the co-variance matrix. I have to use the 'omitrows' in the
    % cov() function to omit rows which contain NaN in order not to mess
    % up the covariance matrix. If I don't do this then the covariance
    % matrix has a lot of NaN values and this is not usable
    covariance = cov(new_data,'omitrows');
    
    % Finding the eigen-values and eigen-vectors
    [V D] = eig(covariance);
    D = diag(D);
    norm_D = D./sum(D);
    [s_V idx] = sort(V,'descend')
    
    tot = 0;
    for i = 0:numel(D)-1
        if tot < 0.95
            tot = tot + norm_D(numel(D)-i);
            chosen_D(i+1) = norm_D(numel(D)-i);
        else
            break;
        end
    end
    
    new_data = data*V(:,1:chosen_D)
    
    % I have normalised array D but I am unsure abou the instructions for
    % the part about V. This is as far as I have gotten
    
    
end