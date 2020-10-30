function mp = moon_position(t)

    %Distance of the Earth to the moon in meters
    d_em = 400.5 * 10^6; 
    
    %  Time it takes for moon to orbit the Earth in seconds
    T = 27.321582 * 24 * 3600;
    
    theta_zero = -61 / 180 * pi;
    
    % Determines the position of the moon relative to the Earth in vector
    % notation
    dtheta = 2 * pi * t / T; % Change in theta
    mp = [d_em*cos(dtheta + theta_zero);d_em*sin(dtheta + theta_zero)]; 
   % end

end