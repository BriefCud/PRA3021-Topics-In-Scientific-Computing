function [T,Y] = ralston(f,t,y)

    ti = t(1);
    tf = t(2);
    
    n = numel(y);
    
    % Defning step size
    N = 100;
    h = (tf - ti) / N;
    
    T = NaN(N+1,1);
    Y = NaN(n,N+1);
    
    T(1) = ti;
    Y(:,1) = y;

    for i = 1:N
        
        T_new = T(i) + h;
        
        k_1 = h .* f(T(i),Y(:,i));
        k_2 = h .* f( (T(i) + (2/3) * h), (Y(:,i) + (2/3) .* k_1) );
        Y_new = Y(i) + ((1/4) .* k_1 + (3/4) .* k_2);
        
        T(i+1) = T_new;
        Y(:,i+1) = Y_new;
    end
end