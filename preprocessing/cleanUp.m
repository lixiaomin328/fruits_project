function cleanUp(fileName)
load(['../processedData/',fileName,'.mat'])
load(['badId_',fileName,'.mat'])
table = struct2table(processedData);
for i = 1:length(badId)
    subName = badId{i};
    table(strcmp(subName,table.subId)==1,:) = [];
end
processedData = table2struct(table);
save(['../processedData/',fileName,'.mat'],'processedData')