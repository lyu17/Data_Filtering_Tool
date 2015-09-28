function dis = avg_distance( group, nb_num )

    dis = 0;
    count = 0;
    
    for i1 = 1 : nb_num+1
        for i2 = 1 : nb_num+1
            if i1 ~= i2
                dis = dis + sqrt(sum((group(:,i1)-group(:,i2)).^2));
                count = count + 1;
            end
        end
    end
    
    dis = dis / count;
    
end