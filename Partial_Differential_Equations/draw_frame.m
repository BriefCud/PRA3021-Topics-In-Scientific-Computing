function draw_frame(X,Y,Z,xmax,ymax,zmin,zmax)
%    surface(X,Y,Z);

    
    surf(X,Y,Z);
    shading interp;
    axis([0,xmax,0,ymax]);
    xlabel('x'); ylabel('y');
    caxis([zmin,zmax])
    colorbar;
    view(2);
end
