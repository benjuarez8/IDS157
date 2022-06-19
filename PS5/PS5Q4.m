%% 
% Given the soild pH level data, let us determine whether or not the data suggests 
% that the true mean soil pH values differ for the two locations.

locA = [7.58 8.52 8.01 7.99 7.93 7.89 7.85 7.82 7.80];
locB = [7.85 7.73 8.53 7.40 7.35 7.30 7.27 7.27 7.23];
n = length(locA);
m = length(locB);

K = 10^5;
s_obs = abs(mean(locA) - mean(locB));
Z = [locA locB];

count = 0;
for i = 1:K
    Z_pi = Z(:,randperm(n + m));
    s_pi = abs(mean(Z_pi(1:n)) - mean(Z_pi(n+1:2*n)));
    if s_pi > s_obs
        count = count + 1;
    end
end
p = count / K;
disp("Estimate p-value: "); disp(p);
%% 
% With an estimated p-value of approx. 0.03, there is strong evidence to reject 
% the null hypothesis.  This implies that we have strong evidence that the true 
% mean soil pH values differ for the two locations.