function [] = plot_moon_orbit()
    
    Tm=27.3*24*60*60;
    
    N=360;
    for i=0:N, 
        t=i/N*Tm;
        xm=moon_position(t);
        xms(:,i+1)=xm;
    end
    plot(xms(1,:),xms(2,:))
end

