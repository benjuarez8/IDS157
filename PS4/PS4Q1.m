%% Part a

fiji = importdata("fiji.txt");
X = fiji(:,5); % magnitudes
Y = fiji(:,6); % numbers of stations
scatter(X,Y)
title("Numbers of stations vs. Magnitudes")
xlabel("X")
ylabel("Y")
%% Part b 
% Given the representation of $\theta$, let us calculate the following plug-in 
% estimate $\hat{\theta}_n$ :
% 
% $$\hat{\theta}_n = \frac{ \frac{1}{n}\sum_{i=1}^n(X_i-\bar{X})(Y_i - \bar{Y)} 
% }{ \sqrt{\frac{1}{n}\sum_{i=1}^n(X_i-\bar{X})^2\frac{1}{n}\sum_{i=1}^n(Y_i - 
% \bar{Y})^2}} =  \frac{ \sum_{i=1}^n(X_i-\bar{X})(Y_i - \bar{Y)} }{ \sqrt{\sum_{i=1}^n(X_i-\bar{X})^2\sum_{i=1}^n(Y_i 
% - \bar{Y})^2}}$$
% 
% 
% 
% Let us solve with $n1 =\sum_{i=1}^n(X_i-\bar{X})(Y_i - \bar{Y)}, \quad d1 
% = \sum_{i=1}^n(X_i-\bar{X})^2, \quad d2 = \sum_{i=1}^n(Y_i - \bar{Y})^2 \quad 
% \text{such that } \quad \hat{\theta}_n = \frac{n1}{\sqrt{d1 \cdot d2}}$

n = 10^3;
n1 = 0;
d1 = 0;
d2 = 0;
for i = 1:n
    n1 = n1 + ((X(i) - mean(X)) * (Y(i) - mean(Y)));
    d1 = d1 + (X(i) - mean(X))^2;
    d2 = d2 + (Y(i) - mean(Y))^2;
end
plugin = n1/sqrt(d1*d2);
disp("Plug-in estimate: "); disp(plugin);
%% Part c 

B = 10^3;
theta_hat = zeros(B, 1);
for i = 1:B
    samp = datasample([X Y], n);
    Xsamp = samp(:,1);
    Ysamp = samp(:,2);
    theta_hat(i) = corr(Xsamp, Ysamp);
end
bs_se = sqrt(var(theta_hat));
disp("Boostrap estimate of standard error: "); disp(bs_se);
figure
histogram(theta_hat)
hold on 
line([plugin, plugin], ylim, 'LineWidth', 4, 'Color', 'red');
legend('Boostrap replications', 'Estimated correlation');
hold off;
%% 
% We notice a decently strong bell-shaped normal distribution for the boostrap 
% replications of correlation estimates.  Furthermore, we clearly see the plug-in 
% estimate lines essentially directly through the center of the distribution of 
% values.
%% Part d

normal_interval = norminv([0.025 0.975], plugin, bs_se);
disp("Normal 95% confidence interval: "); disp(normal_interval);
pivotal_interval = bootci(B, @corr, X, Y); 
disp("Pivotal 95% confidence interval: "); disp(transpose(pivotal_interval));
%% 
% We notice that the two intervals are very similar.