%% 
% Let us first find the MSE of $\hat{\mu}_{MSE}$ by simulation:

n = 10;
a = 1;
B = 3;
m = 10^4;
mu = (a + B)/2;
sum = 0;
for i = 1:m
    X = a + (B-a) * rand(n,1);
    sum = sum + (((min(X) + max(X))/2) - mu)^2;
end
MSE_sim = sum/m;
disp("MSE of MLE of mu"); disp(MSE_sim);
%% 
% Let us now find the MSE of the plug-in estimate $\hat{\mu}_n = \bar{X}_n$ 
% of $\mu$ analytically:
% 
% We know $MSE[\hat{\mu}_n] = bias[\hat{\mu}_n]^2 + se[\hat{\mu}_n]^2$: 
% 
% $$\to bias[\hat{\mu}_n] = \mathbb{E}[\hat{\mu}_n] - \mu = \mu - \mu = 0$$
% 
% $\to se[\hat{\mu}_n] = \frac{\sigma}{\sqrt{n}} = \frac{1}{\sqrt{n}} \cdot 
% \sqrt{\frac{(\beta - \alpha)^2}{12}} = \frac{1}{\sqrt{10}} \cdot \sqrt{\frac{(3-1)^2}{12}} 
% = \frac{2}{\sqrt{120}}$       (ignore sampling fraction)
% 
% $$\to MSE[\hat{\mu}_n] = 0^2 + (\frac{2}{\sqrt{120}})^2 = \frac{1}{30} \approx 
% 0.0333$$
% 
% Therefore, we see that the MSE of $\hat{\mu}_n$ is about 2 times greater than 
% the simulated MSE of $\hat{\mu}_{MSE}$.