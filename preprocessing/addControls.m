data = readtable('../data/dataCombin.csv');
subId = data.Q93;
gender = data.Q98;
income = data.Q99_4;
education = data.Q100;
processedData = readtable('../processedData/dataCombin.csv');
incomes = zeros(length(table2struct(processedData)),1);
educations = cell(length(table2struct(processedData)),1);
genders = cell(length(table2struct(processedData)),1);

for id = 1:length(subId)
    subName = subId{id};
    index = find(strcmp(processedData.subId,subName)==1);
    for i = 1:length(index)
        genders{index(i)} = gender{id}; 
        educations{index(i)} = education{id}; 
        incomes(index(i)) = income(id); 
    end
end
%incomes = str2num(incomes);
processedData.income = incomes;
processedData.education = educations;
processedData.gender = genders;
writetable(processedData,'../processedData/controls.csv')

