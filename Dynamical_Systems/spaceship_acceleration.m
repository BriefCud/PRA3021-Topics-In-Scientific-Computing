function a = spaceship_acceleration(xm,xs)

    % Gravitational Contsant  in N*(m^2)*kg^(-2)
    G = 6.673 * 10^(-11);
    
    % Mass of the Earth and Moon in kg
    Me = 5.97 * 10^24;
    Mm = 7.35 * 10^22;
    
    a = -G * ((Me/(norm(xs)^3) .* xs) + (Mm/(norm(xs-xm)^3) .* (xs-xm)));

end