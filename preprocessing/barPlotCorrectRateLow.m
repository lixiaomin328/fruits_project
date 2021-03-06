function [means,se,n] = barPlotCorrectRateLow(correctRatesTable)
table = sortrows(correctRatesTable,'valueDiffabs');
table = table(table.valueDiffabs<0.55,:); %low value difference
nCongruent = table.nCount(table.congruency==1); %total number of n for congruency and incongruency
nIncongruent = table.nCount(table.congruency==0);
positiveNumberCongr = table.nCount(table.congruency==1)'*table.correctRates(table.congruency==1);
positiveNumberIncongr = table.nCount(table.congruency==0)'*table.correctRates(table.congruency==0);
nTotalCongruent = sum(nCongruent);
nTotalIncongr = sum(nIncongruent);
pCon= positiveNumberCongr/nTotalCongruent;
pIncon = positiveNumberIncongr/nTotalIncongr;
means = [positiveNumberCongr/nTotalCongruent,positiveNumberIncongr/nTotalIncongr];
se = [pCon*(1-pCon)/sqrt(nTotalCongruent),pIncon*(1-pIncon)/sqrt(nTotalIncongr)];
n = [nTotalCongruent,nTotalIncongr];
