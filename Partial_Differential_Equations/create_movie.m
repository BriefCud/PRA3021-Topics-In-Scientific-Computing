function create_movie(u,xmax,ymax,tmax)

umin=min(min(min(u))); umax=max(max(max(u)));

Nx=size(u,1); Ny=size(u,2); Nt=size(u,3)-1;
kx=xmax/Nx; ky=ymax/Ny; h=tmax/Nt;

xs=linspace(0,xmax,xmax/kx);
ys=linspace(0,ymax,ymax/ky);
[X,Y]=meshgrid(xs,ys);

figure
for j=0:Nt
    U=u(:,:,j+1)';
    draw_frame(X,Y,U, xmax,ymax, umin,umax)
    title(['u at t=',num2str(j*h)]);
    drawnow

    % Store the frame
%     M(1+j/dNt)=getframe(gcf); % leaving gcf out crops the frame in the movie.
end

% To play movie, use:
% movie(M);


