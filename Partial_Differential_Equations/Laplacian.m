function LU = Laplacian(U,k)
    
    % Extract the maximum index size for the x and y variables
    [mx,my] = size(U);
    
    % Create a function handle that deals with periodic boundary
    % conditions. The first index is the same as the last index. 
    px = @(i)mod(i-1,mx)+1;
    py = @(i)mod(i-1,my)+1;
    
    % Reserve an array
    LU = NaN(mx,my);
    for ix = 1:mx
        for iy = 1:my
            % Discretised Laplace Operator
            U1 = U(px(ix+1),iy);
            U2 = U(px(ix-1),iy);
            U3 = U(ix,py(iy+1));
            U4 = U(ix,py(iy-1)); 
            LU(ix,iy) = 1/k^2*(U1+U2+U3+U4-4*U(ix,iy)); 
        end
    end

end
