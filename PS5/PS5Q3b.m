l0 = 1;
n = 20;
a = 0.05;
m = 10^4;

X = poissrnd(l0, 1, n);
X_bar = mean(X);
W = abs((X_bar - l0) / sqrt(X_bar / n));
disp("W: "); disp(W);
%% 
% Since W < 1.96, we do not reject the null hypothesis $H_0$ in this case.  
% Let us now repeat this process $m=10^4$ times and report the estimated type 
% I error rate.

reject = 0;
for i = 1:m
    data = poissrnd(l0, 1, n);
    meanX = mean(data);
    Wald = abs((meanX - l0) / sqrt(meanX / n));
    if Wald > 1.96
        reject = reject + 1;
    end
end
typeI_error_rate = reject / m;
disp("Estimated type I error rate: "); disp(typeI_error_rate);
%% 
% We see that the estimated type I error rate is typically quite low which suggests 
% that the null hypothesis is generally not rejected.