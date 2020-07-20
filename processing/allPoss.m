allValues = [];
for i = 0:5
    for j = 0:5
        if i+j>5||i+j<2
            continue;
        end
        for m = 0:5
            for n =0:5
                if m+n>5||m+n<2
                    continue;
                elseif abs(i+j-m-n)>2||(i+j+m+n)<6
                    continue;
                elseif i==m&&j==n
                    continue;
                elseif i==0&&m==0
                    continue;
                elseif j==0&&n==0
                    continue;
                elseif (i-m)*(j-n)>=0
                    continue;
                else
                values = valueCal([i,j;m,n]);
                diff = values(1)-values(2);
                data = [i,j,m,n,values,diff];
                allValues=[allValues;data];
                end
            end
        end
    end
end