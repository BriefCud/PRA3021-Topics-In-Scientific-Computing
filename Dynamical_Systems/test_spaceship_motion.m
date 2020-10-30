15e6%% A simple test file to see if the spaceship_motion function works

earth_mass = 5.97e24;
gravitational_constant = 6.67e-11;
X0 = [15e6; % Initial x-position
      0e6;  % Initial y-position
      2e3;  % Initial velocity in x-direction
      4e3]; % Initial velocity in y-direction

[T,X] = ode45(@spaceship_motion,[0 15000],X0);
[Y,C] = ralston(@spaceship_motion,[0 15000],X0);

figure
plot(X(:,1),X(:,2))
hold on
plot(C(:,1),C(:,2))
hold off
hold on
plot(0,0,'ro')
xlabel('x-position (m)')
ylabel('y-position (m)')