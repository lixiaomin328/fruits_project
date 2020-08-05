%pairwise ttest
total1 = 4*23;
total2 = 6*24;
n1 = round(tablecongruent.correctRates(1:4)*23);
n2 = round(tableincongruent.correctRates(1:6)*23);
x1 = [ones(sum(n1),1);zeros(total1 - sum(n1),1)];
x2 = [ones(sum(n2),1);zeros(total2 - sum(n2),1)];
[h,p,t] = ttest2(x1,x2);

%%
%exact test
total1 = sum(tablecongruent.nCount);
total2 = sum(tableincongruent.nCount);
n1 = round(tablecongruent.correctRates'*tablecongruent.nCount);
n2 = round(tableincongruent.correctRates'*tableincongruent.nCount);
x1 = [ones(sum(n1),1);zeros(total1 - sum(n1),1)];
x2 = [ones(sum(n2),1);zeros(total2 - sum(n2),1)];
p1 = n1/total1;
p2= n2/total2;
[h1,x,t1] = ttest2(x1,x2);