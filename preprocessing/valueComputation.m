fileName = 'fruits_decimals.xlsx';
load(['../processedData/',fileName,'.mat'])
valueTable = readtable('../fruits.xlsx');
imgNamefromExcel = valueTable.ImageName(1:end-1);
valueDiff = valueTable.Difference(1:end-1);%value cannot have zeros
saliencyLocation = valueTable.SalientSide(1:end-1);
saliencyIndicator = strcmp('Left',saliencyLocation);

valueSign = ones(length(valueDiff),1);
valueSign(valueDiff<0) =0;
congruentIndicator = (sum(saliencyIndicator+valueSign,2)==1);
congruentIndicator = (congruentIndicator-1)*-1;
%0 is incongruent
correctRate = [];
nCount = [];
for i = 1:length(imgNamefromExcel)
    imageName = [imgNamefromExcel{i},'.jpg'];
    indexC = find(strcmp({processedData.imgName},imageName));
    for j = 1:length(indexC)
        processedData(indexC(j)).congruency=congruentIndicator(i);
        processedData(indexC(j)).valueDiff=valueDiff(i);
        processedData(indexC(j)).saliencyLocation=saliencyIndicator(i);
        correctAnswer = (sign(valueDiff(i))+1)/2;
        responseInd =strcmp('Left',processedData(indexC(j)).response);
        processedData(indexC(j)).correctness=(responseInd==correctAnswer);
        if processedData(indexC(j)).nClicks ==0
            processedData(indexC(j)).correctness=[];
        end
    end
    correctRate = [correctRate;mean([processedData([indexC]).correctness])];
    nCount = [nCount;length([processedData([indexC]).correctness])];
end
correctRatesSummary = struct('imgName',imgNamefromExcel,'congruency',arrayfun(@(x){x}, ...
congruentIndicator),'valueDiffabs',arrayfun(@(x){x}, abs(valueDiff)),'correctRates',...
arrayfun(@(x){x},correctRate),'nCount',arrayfun(@(x){x}, nCount));
correctRatesTable = struct2table(correctRatesSummary);

tablecongruent = correctRatesTable(correctRatesTable.congruency==1,:);
tablecongruent = sortrows(tablecongruent,'valueDiffabs');
tableincongruent = correctRatesTable(correctRatesTable.congruency==0,:);
tableincongruent = sortrows(tableincongruent,'valueDiffabs');