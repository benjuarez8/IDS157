mu = 5;
n = 100;
sigma = 1;
r = 10^4;
theta = exp(mu);
theta_hat = zeros(r,1);
theta_hat_J = zeros(r,1);
for j = 1:r
    X = normrnd(mu,sigma,n,1);
    theta_hat(j) = exp(mean(X));
    theta_hat_J_j = zeros(n,1);
    for i = 1:n
        X_jk = X([1:i-1,i+1:end]);
        theta_hat_J_j(i) = exp(mean(X_jk));
    end
    theta_hat_J(j) = n*exp(mean(X)) - (n-1)*mean(theta_hat_J_j);
end
B1 = mean(theta_hat) - theta
B2 = mean(theta_hat_J) - theta
%% 
% We see that B1 is approximately equal to the exact bias value seen in part 
% (b).  We also see that B1 is larger (in absolute value) than B2.