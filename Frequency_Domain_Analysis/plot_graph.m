function g = plot_graph(x,y,T,t,d)
    
    if (d == 0)
        g = fplot(x,[0,T]); hold on; plot(t,x(t),'x');
    elseif (d == 1)
        g = plot(x, y);
    else
        error = ("Incorrect value for variable d in the function plot_graph.");
        g = err(error);
    end

end