function sm = spaceship_motion(t,p_init)

    % Values for DIY 4
    % position = [15e6;0e6]
    % velocity = [2e3;4e3]
    % velocity_2 = [3.9e3;6e3]

    xs = p_init(1:2);
    vs = p_init(3:4);
    as = spaceship_acceleration(moon_position(t),xs);
    sm = [vs;as];

end