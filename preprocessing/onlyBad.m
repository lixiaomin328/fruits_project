fileName = 'data22';
load(['../processedData/',fileName,'.mat'])
load(['badId_',fileName,'.mat'])
table = struct2table(processedData);
table.index = ones(size(table,1),1);
for i = 1:size(table,1)
    subName = table.subId{i};
    if sum(strcmp(subName,badId))==0
        table.index(i) = 0;
    end
end
table = table(table.index==1,:);
processedData = table2struct(table);
save(['../processedData/',[fileName,'bad'],'.mat'],'processedData')