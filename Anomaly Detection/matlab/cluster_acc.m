function rand = cluster_acc( label, cluster )

num_cluster = max(max(cluster));

a = 0; 
b = 0; 
c = 0; 
d = 0;


row = size(label,1);
num = size(label,2);

pair = [];

for i = 1 : num
    for j = (i+1) : num
        pair = [pair;[i,j]];
    end
end

pair_num = size(pair,1);

rand_sum = 0;

for i = 1 : row

    for k = 1 : pair_num

        if label(i,pair(k,1)) == label(i,pair(k,2)) && cluster(i,pair(k,1)) == cluster(i,pair(k,2))
            a = a + 1;
        elseif label(i,pair(k,1)) ~= label(i,pair(k,2)) && cluster(i,pair(k,1)) ~= cluster(i,pair(k,2))
            b = b + 1;
        elseif label(i,pair(k,1)) == label(i,pair(k,2)) && cluster(i,pair(k,1)) ~= cluster(i,pair(k,2))
            c = c + 1;
        elseif label(i,pair(k,1)) ~= label(i,pair(k,2)) && cluster(i,pair(k,1)) == cluster(i,pair(k,2))
            d = d + 1;
        end

    end
    
    rand = (a+b) / pair_num;
    
    rand_sum = rand_sum + rand;
    
    a = 0; 
    b = 0; 
    c = 0; 
    d = 0;

end

rand_avg = rand_sum / row;
