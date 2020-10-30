function out = pr_test(degree)
    
    if (degree == 2)
        % Generating random coordinates out of a polynomial 2x^2 + 3x +7
        c = [2 3 7];
        x = randn(1,1000);
        y = c(1)*x.^2 + c(2)*x + c(3) + randn(size(x));

        A = [x(:).^2,x(:),ones(numel(x),1)];

        theta = A\y'
        out = [c(:),theta];
        y_fit = A*theta;
        plot(x,y,'.r',x,y_fit,'.k');

        xint = -2;
        yint = [xint^2 xint 1]*theta;
        hold on; plot(xint,yint,'.b','MarkerSize',20); hold off;

        new_x = max(x) + 0.2;
        new_y = [new_x^2 new_x 1]*theta;
        hold on; plot(new_x,new_y,'.b','MarkerSize',20); hold off;

        R_sq = (1-sum((y(:)-y_fit(:)).^2))/sum((y(:)-mean(y(:))).^2)
        
    elseif (degree == 3)
        c = [-2 3 7 1];
        x = randn(1,1000)/1.5;
        y = polyval(c,x) + randn(size(x));
        
        A = [x(:).^3,x(:).^2,x(:),ones(numel(x),1)];
        theta = A\y(:);
        y_fit = A*theta;
        plot(x,y,'.r',x,y_fit,'.r');
        out = [c(:),theta];
        
    elseif (degree == 'AIC')
        
        c = [-2 4 3];
        x = randn(1,1000)/1.5;
        y = polyval(c,x) + randn(size(x));
        plot(x,y,'.r')
        for k = 1:10
            A = [];
            for j = 0:1:k-1
                A = [x(:).^j A];
            end
            theta = A\y(:);
            y_fit = A*theta;
            AIC(k) = numel(y)*log(sum((y(:)-y_fit(:)).^2)/numel(y)) + 2*k;
        end
        figure(2);
        plot(AIC,'.-');
        [~,order] = min(AIC);
        order
        
        
    else
        disp("use 2, 3, or AIC in the arguments for something to happen")
    end
end