fileName = 'dataCombin';
opts = detectImportOptions('../Stimulu_table/fruits-3.xlsx','Sheet','Sheet5');
opts.VariableNamesRange = 'A1';
load(['../processedData/',fileName,'.mat'])
valueTable = readtable('../Stimulu_table/fruits-3.xlsx',opts,'Sheet', 'Sheet5');
imgNamefromExcel = valueTable.Var1(:);
valueDiff = valueTable.Var9(:);%value cannot have zeros
saliencyLocation = valueTable.Var2(:);
saliencyIndicator = strcmp('Left',saliencyLocation);

valueSign = ones(length(valueDiff),1);
valueSign(valueDiff<0) =0;
congruentIndicator = saliencyIndicator ==valueSign;
% congruentIndicator = (sum(saliencyIndicator+valueSign,2)==1);
% congruentIndicator = (congruentIndicator-1)*-1;
% %0 is incongruent
correctRate = [];
nCount = [];
for i = 1:length(imgNamefromExcel)
    imageName = [imgNamefromExcel{i}];
    indexC = find(strcmp({processedData.imgName},imageName));
    for j = 1:length(indexC)
        processedData(indexC(j)).congruency=congruentIndicator(i);
        processedData(indexC(j)).valueDiff=valueDiff(i);
        processedData(indexC(j)).saliencyLocation=saliencyIndicator(i);
        correctAnswer = (sign(valueDiff(i))+1)/2;
        responseInd =strcmp('Left',processedData(indexC(j)).response);
        processedData(indexC(j)).correctness=(responseInd==correctAnswer);
        if processedData(indexC(j)).nClicks ==0 ||isempty(processedData(indexC(j)).response) 
           processedData(indexC(j)).correctness=[];
%             processedData(indexC(j)).correctness=0;
%             processedData(indexC(j)).nClicks=1;
%             processedData(indexC(j)).response='miss';
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

total1 = sum(tablecongruent.nCount);
total2 = sum(tableincongruent.nCount);
n1 = tablecongruent.correctRates'*tablecongruent.nCount;
n2 = tableincongruent.correctRates'*tableincongruent.nCount;
x1 = [ones(sum(n1),1);zeros(total1 - sum(n1),1)];
x2 = [ones(sum(n2),1);zeros(total2 - sum(n2),1)];
p1 = n1/total1;
p2= n2/total2;
[h1,x,t1] = ttest2(x1,x2);