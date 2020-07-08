i=21;for file in *.JPG                                            14:06:11  
do
mv $file "img_$i.jpg"
i=$((i+1))
done