function D = square_dist(U,v)
% This function calculates the euclidean distance between two points
    N = size(U,1);
    D = NaN(N,1);
    
    for i = 1:N
    % take the square root of the sum of the squares of the difference
    % between the points of interest in each axis and add the distance to
    % an array
        D(i) = (U(i,1) - v(1)).^2 + (U(i,2) - v(2)).^2;       
    end
end