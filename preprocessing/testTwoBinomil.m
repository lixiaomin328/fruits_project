function [z,p3,p1,p2,h,p] = testTwoBinomil(p1,p2,n1,n2)
data1 = [ones(round(n1*p1),1);zeros(round(n1*(1-p1)),1)];
data2 = [ones(round(n2*p2),1);zeros(round(n2*(1-p2)),1)];
[h,p]=ttest2(data1,data2);
addpath('~/Documents/matlabShortCut')
[z,p1,p2,p3] = compare_bino_prob(data1',data2');