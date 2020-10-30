function analysisFile_StarTypeDataset()

%     clc;clear;close;

    % read the data for the StarTypeDataset.csv file
    filename = 'StarTypeDataset.csv';
    data = csvread(filename,1,0);

    K = 7; % Number of clusters
    neighbors = 1; % Number of nearest neighbours
    
    boundary_sample(data,K)

    %% run your myKmeans function for clustering the data
    % This is the function for the first task
    % Add a third integer parameter to display a graph of the centers
%     [IDX,C] = myKMeans(data,K)

    %% run your myKNN function for classifying a set of testing points
%     test_data = [0.75 -0.1;-0.9 -0.1;0.6 0.08;-1.25 -0.2];
%     myKNN(IDX,data,test_data,Knn)
end