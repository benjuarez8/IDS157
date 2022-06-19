n = 50;
theta = 1;
B = 10^4;
sample = unifrnd(0,1,n,1);
theta_hat_MLE = max(sample);
p = zeros(B,1);
np = zeros(B,1);

for i = 1:B
    p(i) = max(unifrnd(0,theta_hat_MLE,n,1));
    np(i) = max(datasample(sample,n));
end

figure
fplot(@(x) (n.*x.^(n-1)), [0.8,1], 'LineWidth',3,'Color','blue')
hold on
histogram(p, 'Normalization', 'pdf')
histogram(np, 'Normalization', 'pdf')
legend({'True Distribution','Parametric', 'Nonparametric'},'Location', 'west')
hold off
%% 
% We see the bootstrap replications follow a similar exponential trend along 
% the general path of the true distribution (analytical PDF).  Clearly, the parametric 
% PDF more closely matches the true distribution of $\hat{\theta}_{MLE}$ in comparison 
% to the nonparamteric PDF.  Comparing the two histograms, the nonparametric PDF 
% is much more sparse which makes sense due to its construction.