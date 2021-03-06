[meansHigh,seHigh,nLow] = barPlotCorrectRateHigh(correctRatesTable);
[meansLow,seLow,nHigh] = barPlotCorrectRateLow(correctRatesTable);
h = barwitherr([seLow;seHigh], [meansLow;meansHigh]);
set(gca,'XTickLabel',{'Low Value Difference','High Value Difference'})
legend('Congruent','Incongruent')
ylabel('Percent Correct')
