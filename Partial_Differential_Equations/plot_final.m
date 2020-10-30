function plot_final(u,v,xmax,ymax)
    hold off
    Nx=size(u,1); Ny=size(u,2);
    kx=xmax/Nx; ky=xmax/Ny;
    xs=(0:Nx-1)*kx;
    ys=linspace(0,ymax-ky,Ny);

    [X,Y]=meshgrid(xs,ys);


    umin=min(min(min(u))), umax=max(max(max(u)))
    vmin=min(min(min(v))), vmax=max(max(max(v)))

    figure
    subplot(1,2,1); U=u(:,:,end)';
    draw_frame(X,Y,U,xmax,ymax,umin,umax)
    subplot(1,2,2); V=v(:,:,end)';
    draw_frame(X,Y,V,xmax,ymax,vmin,vmax)
end
