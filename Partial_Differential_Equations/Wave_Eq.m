 function [U,V] = Wave_Eq(F,v_i,xmax,ymax,T,h,k,c,o)
    
    if (h<0.4*k^2)
        if ~exist('o','var')
            mx = xmax / k ;
            my = ymax / k;
            n = round(T / h);

            U = NaN(mx,my,n+1);
            V = NaN(mx,my,n+1);
            for ix = 1:mx
                for iy = 1:my
                    x = ix * k;
                    y = iy * k;
                    U(ix,iy,1) = F(x,y);
                end
            end
            V(:,:,1) = v_i;

            for i = 1:n
                U(:,:,i+1) = U(:,:,i) + h * V(:,:,i);
                V(:,:,i+1) = V(:,:,i) + h * c^2 * Laplacian(U(:,:,i),k);
            end
        else
            f = @(z)sin(2*pi*z);
            a = 1;
            b = 1/2;
            z = @(x,y)a*x + b*y;
            dfdz = @(z)-2*pi*cos(2*pi*z);
            v_init = @(z)-c*sqrt(a^2 + b^2)*dfdz(z);

            mx = xmax / k ;
            my = ymax / k;
            n = round(T / h);

            U = NaN(mx,my,n+1);
            V = NaN(mx,my,n+1);
            for ix = 1:mx
                for iy = 1:my
                    x = ix * k;
                    y = iy * k;
                    u = z(x,y);
                    U(ix,iy,1) = f(u);
                    V(ix,iy,1) = v_init(u);
                end
            end

           

            for i = 1:n
                U(:,:,i+1) = U(:,:,i) + h * V(:,:,i);
                V(:,:,i+1) = V(:,:,i) + h * c^2 * Laplacian(U(:,:,i),k);
            end
        end
    end
end
