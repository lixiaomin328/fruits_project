table = struct2table(processedData);
rtHighCongruent = table.rt(table.valueDiff>0.55&table.congruency==1);
rtHighinCongruent = table.rt(table.valueDiff>0.55&table.congruency==0);
rtLowCongruent = table.rt(table.valueDiff<0.55&table.congruency==1);
rtLowinCongruent = table.rt(table.valueDiff<0.55&table.congruency==0);
meansLow = [mean(rtLowCongruent),mean(rtLowinCongruent)];
meansHigh = [mean(rtHighCongruent),mean(rtHighinCongruent)];
seLow = [std(rtLowCongruent)/sqrt(length(rtLowCongruent)),std(rtLowinCongruent)/sqrt(length(rtLowinCongruent))];
seHigh = [std(rtHighCongruent)/sqrt(length(rtHighCongruent)),std(rtHighinCongruent)/sqrt(length(rtHighinCongruent))];
h = barwitherr([seLow;seHigh], [meansLow;meansHigh]);
set(gca,'XTickLabel',{'Low Value Difference','High Value Difference'})
legend('Congruent','Incongruent')
ylabel('response time in s')