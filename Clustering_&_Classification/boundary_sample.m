function boundary_sample(data,K)

    cmap = [0.80369089, 0.61814689, 0.46674357;
    0.81411766, 0.58274512, 0.54901962;
    0.58339103, 0.62000771, 0.79337179;
    0.83529413, 0.5584314 , 0.77098041;
    0.77493273, 0.69831605, 0.54108421;
    0.72078433, 0.84784315, 0.30039217;
    0.96988851, 0.85064207, 0.19683199;
    0.93882353, 0.80156864, 0.4219608 ;
    0.83652442, 0.74771243, 0.61853136;
    0.7019608 , 0.7019608 , 0.7019608];

    rng(2); % Set seed
    Knn = 1; % K- nearest neighbours

    C = kmeans(data, K); % Class labels for each training point

    Xplot = linspace(min(data(:,1)), max(data(:,1)), 100);
    Yplot = linspace(min(data(:,2)), max(data(:,2)), 100);

    % Obtain the grid vectors for the two dimensions
    [Xv,Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
    classes = length(Xv(:));

    test_point = [0.75 -0.1;-0.9 -0.1;0.6 0.08;-1.25 -0.2];

%     for i = 1:length(gridX) % Apply k-NN for each test point  
%         g(i) = myKNN(C,data,test_point,Knn);
%     end
    
    figure;
    % This function will draw the decision boundaries
    [CC,h] = contourf(Xplot(:), Yplot(:), reshape(classes, length(Xplot), length(Yplot)));
    set(h,'LineColor','none');
    colormap(cmap); hold on;

    % Plot the scatter plots grouped by their classes
    scatters = gscatter(data(:,1), data(:,2), C, [0,0,0;0,0,1;0,1,1;1,0,0;1,1,0;1,0,1], 'o',4);

    % Fill in the color of each point according to the class labels.
    for n = 1:length(scatters)
    set(scatters(n), 'MarkerFaceColor', cmap(n,:));
    end

end