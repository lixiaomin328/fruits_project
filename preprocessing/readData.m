data = readtable('../data/dataCombin.csv');
fileName = 'dataCombin';
load('img_data.mat')
% imgLists= {'flippedimg_4.jpg','flippedimg_6.jpg','flippedimg_8.jpg',...
% 'flippedimg_21.jpg','flippedimg_36.jpg','flippedimg_42.jpg','flippedimg_46.jpg',...
% 'flippedimg_27.jpg','flippedimg_29.jpg','flippedimg_45.jpg','flippedimg_10.jpg',...
% 'flippedimg_3.jpg','flippedimg_11.jpg','img_2.jpg','img_3.jpg','img_4.jpg','img_11.jpg'...	
% ,'img_14.jpg','img_16.jpg','img_19.jpg'};
choicStartPlace=48;%the first chohice place
period = 5; %two choices position

subId = data.Q93;

%generate the table
responses= [];
RTs=[];
nClicks = [];
imgNames ={};
subIds = [];
for i = 0:length(imgLists)-1
    nClicks=[nClicks;table2array(data(:,choicStartPlace+4+i*period))];
    responses=[responses;table2array(data(:,choicStartPlace+i*period))];
    RTs=[RTs;table2array(data(:,choicStartPlace+2+i*period))];
    imgNames = [imgNames;repmat({imgLists{i+1}},length(subId),1)];
    subIds = [subIds;subId];
end
processedData = struct('imgName',imgNames,'subId',subIds,'response',responses,'rt',arrayfun(@(x){x}, RTs),'nClicks',arrayfun(@(x){x}, nClicks));
save(['../processedData/',fileName,'.mat'],'processedData')
%ifcleanup
%cleanUp(fileName);