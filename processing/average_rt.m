[row, col] = size(processedData);
trials = 10;
congruentList= {'flippedimg_6.jpg','flippedimg_11.jpg',...
'flippedimg_12.jpg','flippedimg_19.jpg',...
'flippedimg_27.jpg','flippedimg_29.jpg',...
'img_9.jpg','img_18.jpg','img_30.jpg'};
incongruentList= {'flippedimg_23.jpg','flippedimg_13.jpg','flippedimg_18.jpg',...
'flippedimg_25.jpg','flippedimg_33.jpg',...
'img6.jpg','img_13.jpg','img_23.jpg'...	
,'img_25.jpg','img_28.jpg'};
%no img_8.jpg bc diffrence is zero
incongruentTotal=0;
congruentTotal=0;
for i = 1:row
    if any(strcmp(congruentList, processedData(i).imgName))
        congruentTotal = congruentTotal + processedData(i).rt;
    end
    if any(strcmp(incongruentList, processedData(i).imgName))
        incongruentTotal = incongruentTotal + processedData(i).rt;
    end
end 
[row_con, col_con] = size(congruentList);
[row_in, col_in] = size(incongruentList);
congruentTotal = congruentTotal / (col_con * trials)
incongruentTotal = incongruentTotal / (col_in * trials)
    