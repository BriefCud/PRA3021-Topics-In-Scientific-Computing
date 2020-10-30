function [IDX,C] = myKMeans(M,K,g)

    N = size(M,1);

    % Finding the minimum and maximum values of the dataset in each column
    max_x = max(M(:,1),[],'all');
    min_x = min(M(:,1),[],'all');
    max_y = max(M(:,2),[],'all');
    min_y = min(M(:,2),[],'all');

    % Creates 'K' amount of random center points
    r_x = (max_x - min_x).*rand(K,1) + min_x;
    r_y = (max_y - min_y).*rand(K,1) + min_y;

    % Creating an empty array which will hold the center points
    C = NaN(K,2);
    
    for i = 1:K
    % Assinging corresponding elements in r_x and r_y to the array C 
        C(i,:) = [r_x(i) r_y(i)];
    end
    
    % Creating an array that will hold the square distances between the
    % centers and the data points, the minimum distance, the index of  
    % the minimum distance & the change in centers with each iteration
    D = NaN(N,K); value = NaN(N,1); IDX = NaN(N,1); CC = NaN(K,2,K);
    
    CC(:,:,1) = C;
    
    iter = 0;
    temp = 0;
    while temp == 0
        
        iter = iter + 1;
        
        if iter == 1
            % Assign the sqaure distances to the array D
            for i = 1:K
                D(:,i) = square_dist(M,C(i,:));
            end
        else 
            for i = 1:K
                D(:,i) = square_dist(M,C_new(i,:));
            end
        end
        
        % Finding the minimun value & index of each row in the array D
        for i = 1:N
            [value(i),IDX(i)] = min(D(i,:));
        end
        
        % To update the centers I have to calculate the mean of all the
        % data points which are assigned to a cluster
        for i = 1:K
            % Create an array which holds the position of the minimum data
            % point in the IDX array which corresponds to each cluster
            pos = (IDX==i);
            C_pos(:,i) = pos;
            C_new(i,:) = [mean(M(pos,1)) mean(M(pos,2))];
        end
        
        % Assign the centers to a 3D array
        CC(:,:,iter+1) = C_new;
        
        if iter ~= 1
            % If the coordinates of the centers in the array CC don't
            % change set the temp variable to 1 in order to exit the loop
            if CC(:,:,iter) == CC(:,:,iter-1)
                temp = 1;
                CC(:,:,iter) = [];
            else
                temp = 0;
            end
        else
            temp = 0;
        end 
    end
    if ~exist('g','var')
        % If third parameter doesn't exist set it to a default value
          g = 0;
    else
        
        v = VideoWriter('myAnimation.avi');
        v.FrameRate = 10; % slow down the animation
        open(v);
        % Struct to hold frames
        F(N) = struct('cdata',[],'colormap',[]); 

        for i = 1:iter+1
            % plot what you want in the new frame
            scatter(M(:,1),M(:,2),'x'); hold on;
            scatter(CC(:,1,i),CC(:,2,i),'+'); hold off; 
            % clear and draw new frame
            drawnow 
            frame = getframe;

            F(i) = frame;
            pause(0.3); 
            
            % Save the file to the source folder
            %writeVideo(v,frame); 
        end
        
        close(v);
    end
end





