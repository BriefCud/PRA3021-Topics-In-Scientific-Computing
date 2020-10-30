function [U,V] = Reaction_Diffusion_Eq(ku,kv,kappa,h,xmax,ymax,T)

    c = [4.5,13.0;4.5,9.0]; 
    f = @(u,v)c(1,1) + u.^2 .* v - c(1,2) .* u - u;
    g = @(u,v)c(1,2) .* u - u.^2 .* v;

    mx = xmax/kappa;
    my = ymax/kappa;
    n = round(T/h);
    
    U = NaN(mx,my,n+1);
    V = NaN(mx,my,n+1);
        
    for ix = 1:mx
        for iy = 1:my
            U(ix,iy,1) = f(ix*kappa,iy*kappa);
            V(ix,iy,1) = g(ix*kappa,iy*kappa);
        end
    end
    
    for i = 1:n
        Ui = U(:,:,i);
        Vi = V(:,:,i);
        U(:,:,i+1) = Ui+h*(ku*Laplacian(Ui,kappa)+f(Ui,Vi));
        V(:,:,i+1) = Vi+h*(kv*Laplacian(Vi,kappa)+g(Ui,Vi));
    end
end
