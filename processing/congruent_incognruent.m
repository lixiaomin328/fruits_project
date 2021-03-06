data_table = struct2table(processedData);
data_table.valueDiff = abs(data_table.valueDiff);
low_diff = data_table(data_table.valueDiff<0.55,:);
high_diff = data_table(data_table.valueDiff>0.55,:);
low_congruent = low_diff(low_diff.congruency == 1,:); 
low_incongruent = low_diff(low_diff.congruency == 0,:); 
high_congruent = high_diff(high_diff.congruency == 1,:); 
high_incongruent = high_diff(high_diff.congruency == 0,:); 
