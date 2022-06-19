mu = 5;
n = 100;
sigma = 1;
X = normrnd(mu,sigma,n,1);
actual_bias = exp(mu) * (exp(1/(2*n)) - 1);
theta = zeros(n,1);
for i = 1:n
    X_jk = X([1:i-1,i+1:end]);
    theta(i) = exp(mean(X_jk));
end
jk_theta_bar = mean(theta);
jk_bias_est = (n-1) * (jk_theta_bar - exp(mean(X)));

disp("Bias (actual):"); disp(actual_bias);
disp("Bias (jackknife estimate):"); disp(jk_bias_est);
%% 
% We see that the estimated bias value (using the jackknife method) is slightly 
% lower than the actual bias value 0.7439, but the two values are generally very 
% similar.