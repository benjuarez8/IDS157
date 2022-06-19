% Part (a) 

fiji = importdata("fiji.txt");
magnitudes = fiji(:,5);

figure
ecdf(magnitudes, "Alpha",0.05,"Bounds","on")
title("eCDF and 95% confidence band")
% Part (b)

[f,x,flo,fup] = ecdf(magnitudes,"Alpha",0.05);
figure
hold on
plot(x,f)
plot(x,flo)
plot(x,fup)
legend("eCDF", "Lower confidence bound", "Upper confidence bound", "Location","east")
title("eCDF and 95% confidence band (linear approximations)")