%% For the first part of the wave equation task
xmax = 4;
ymax = 4;
c = 1; % Speed of light
k = 0.2;
h = 0.01;
xc = 1; % x coordinate of center
yc = 1; % y coordinate of center
T = 1;

u_i=@(x,y)exp(-((x-xc)^2+(y-yc)^2));
v_i = zeros(xmax/k,ymax/k);

[U_wave_1,V_wave_1] = Wave_Eq(u_i,v_i,xmax,ymax,T,h,k,c);
create_movie(U_wave_1,xmax,ymax,T);

%% For the second part of the wave equation task

% [U_wave_2,V_wave_2] = Wave_Eq(u_i,v_i,xmax,ymax,T,h,k,c,1);
    