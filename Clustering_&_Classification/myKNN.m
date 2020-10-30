function label = myKNN(IDX,M,test_data,Knn)
    
    N = size(M,1);
    m = size(test_data,1); 
    M_cat = cat(2,M,IDX);
    
    % Plot the data points by group
%     gscatter(M_cat(:,1),M_cat(:,2),M_cat(:,3)); hold on;
%     scatter(test_data(:,1),test_data(:,2)); hold off;

    % Create array of the disances between the data points and the 
    % test data points 
    D = NaN(N,m);
    for i = 1:m
       D(:,i) = square_dist(M,test_data(i,:));
    end
    
    % Sort the array D and assign it to the array s_D.
    % idx is an array that tells me where a specific value in the unsorted
    % array appears in the sorted array. The index of the array idx
    % corresponds to the index of of the s_D array but the value at an
    % index corresponds to the index of the value in the unsorted list
    [s_D,pos] = sort(D);
    
    % This array holds the indecies of the data points in the array D,
    % which are closest to the test data points
    pos_closest = pos(1:Knn,:);
    
    for i = 1:size(pos_closest,2)
        % Using the values stored idx_closest get the cluster ID for the K
        % nearest points to the test data.
        pos_cluster(:,i) = IDX(pos_closest(:,i));
        
        % Perform a majority vote on the columns of pos_cluster to see  
        % which cluster the test_data point belongs too
        label(i) = mode(pos_cluster(:,i));
    end 
end







