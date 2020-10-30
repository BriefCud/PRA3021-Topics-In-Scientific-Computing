function [OptimalModelParameters, optimalModelorder, ModelOutput, A] = optimalARmodel(x,y)
%% compute the optimal degree and the parameters of the polynomial that best fits the input data (x,y) using the AIC criterion

y=y(:);
x=x(:);
nrParams = 40;
aic=zeros(1,nrParams);

for k=1:nrParams
    clear theta y_fit A
    
    A=[];
    for j=0:1:k-1
        A=[x.^j A];
    end
    
    theta=A\y;
    y_fit=A*theta;
    n=length(y);
    
    aic(k)=n*log(sum((y-y_fit(:)).^2)/n)+2*k;
    if k>2       
        if(aic(k-1)>aic(k-2))&&(aic(k)>aic(k-1))            
            break;
        end
    end
end

%% plot the AIC values for different plolynomial degrees
figure(1)
plot([1:k],aic(1:k),'.-r');
xlabel('polynomial degree');
ylabel('AIC');

%% assign the output parameters according to the found value of k
optimalModelorder = k-1;
A=[];
for j=0:1:optimalModelorder-1
    A=[x.^j A];
end;
OptimalModelParameters = A\y;
ModelOutput = A*OptimalModelParameters;

%% plot the input data and the fitted regression model
figure(2)
plot(x,y,'.r',x,ModelOutput,'.k');
xlabel('x');
ylabel('y');
legend('Input Data','FittedModel')

end