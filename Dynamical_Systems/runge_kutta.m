function [T,Y] = runge_kutta(f,t,y)

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
        k_2 = h .* f( (T(i) + h / 2), (Y(:,i) + k_1 ./ 2) );
        k_3 = h .* f( (T(i) + h / 2), (Y(:,i) + k_2 ./ 2) );
        k_4 = h .* f( (T(i) + h / 2), (Y(:,i) + k_3 ./ 2) );
        Y_new = Y(i) + (1 / 6) .* (k_1 + 2 .* k_2 + 2 .* k_3 + k_4);
        
        T(i+1) = T_new;
        Y(:,i+1) = Y_new;
    end
end