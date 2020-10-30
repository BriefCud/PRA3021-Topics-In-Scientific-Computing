function [T,Y] = euler(f,t,y)
    % t is the variable for the range of time
    % y is the variable for the initial conditions
 
    ti = t(1);
    tf = t(2);
    
    n = numel(y);
     
    % Defining step size
    N = 100;
    h = (tf - ti) / N;
    
    T = NaN(N+1,1);
    Y = NaN(n,N+1);
    
    T(1) = ti;
    Y(:,1) = y;
    
    for i = 1 : N
        
        Y_new = Y(:,i) + h .* f(T(i),Y(:,i));
        T_new = T(i) + h;
        
        T(i+1) = T_new;
        Y(:,i+1) = Y_new;
       
    end 
end