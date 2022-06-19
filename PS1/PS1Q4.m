% Ben Juarez
% PS1Q4 - Readability of QQ Plots

% Part a
n = 15;
sample_a = normrnd(0,1,[1,n]);
histogram(sample_a);
qqplot(sample_a);
snapnow
% The points on the QQ plot do not appear to fall on a straight line.
% The histogram is neither symmetric, unimnodal, or bell-shaped (perhaps it
% could be interpretted as unimodal in some cases, but there does not seem
% to be enough data points).

% Part b
n = 50;
sample_bi = normrnd(0,1,[1,n]);
histogram(sample_bi);
qqplot(sample_bi);
snapnow
% The points do not appear to fall on a straight line (although, closer
% than part a).
% The histogram is unimodal, but not quite symmetric or bell-shaped.

n = 100;
sample_bii = normrnd(0,1,[1,n]);
histogram(sample_bii);
qqplot(sample_bii);
snapnow
% The points are closer to falling on a straight line, but this condition
% is still not quite met.
% The histogram is unimodal and essentially symmetric as well as generally
% bell-shaped.

n = 1000;
sample_biii = normrnd(0,1,[1,n]);
histogram(sample_biii);
qqplot(sample_biii);
snapnow
% The points appear to fall on a straight line for the most part.
% The histogram is unimodal, symmetric, and bell-shaped.

% Part c
n = 500;
sample_c = normrnd(0,1,[1,n]);
histogram(sample_c);
qqplot(sample_c);
snapnow
% 500 seems to be an appropriate estimate for n* since for n > n* = 500,
% the normal-quantile plots do not deviate substantially from linearity.