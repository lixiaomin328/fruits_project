[meansHigh,seHigh] = barPlotCorrectRate(correctRatesTable);
h = barwitherr([seLow;seHigh], [meansLow;meansHigh]);
set(gca,'XTickLabel',{'Low Value Difference','High Value Difference'})
legend('Congruent','Incongruent')
ylabel('Correction Rate')