function U = Diffusion_Eq(F,k,xmax,ymax,T,kappa,h)

    % If the parameter h is smaller then k do this...
    if (h <= k^2)
        % Calculate the maximum index for the discretisation, mx, from 
        % the maximum index, xmax, of a set x divided by the parameter k.
        % Similarly for the variable my.
        mx = xmax / k;
        my = ymax / k;
        
        % Calculating the number of steps and rounding it to the nearest 
        % integer otherwise the for loop would not work.
        n = round(T / h);
        
        % Discretising F and calculating the inital values
        U = NaN(mx,my,n+1);
        for ix = 0:mx-1
            x = ix * k;
            for iy = 0:my-1
                y = iy * k;
                % Set the first page in U to the intial condition
                U(ix+1,iy+1,1) = F(x,y);
            end
        end

        % start at as the initial value, the first page, has already been set
        for i = 1:n
%             E = h*kappa*del2(U(:,:,i),k);
            E = h*kappa*Laplacian(U(:,:,i),k);
            U(:,:,i+1) = U(:,:,i)+E;
        end
    else
        disp("The parameter h must be much smaller then the parameter k^2")
    end
end