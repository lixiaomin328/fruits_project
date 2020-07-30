imgFile = dir([pwd,'/*.jpg']);
newSize = [1080,1920];
for i = 1:length(imgFile)
    image= imread(imgFile(i).name);
    resized_image = imresize(image,newSize);
    imwrite(resized_image,imgFile(i).name);
    new_image = imread(imgFile(i).name);
    size(new_image)
end