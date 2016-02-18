function neighbor = group_b( node_num, nb_num )

list = 1:node_num;

neighbor = zeros(node_num,nb_num);

for i = 1 : node_num
    
    temp = list;
    
    temp(temp==i) = [];
    
    index = randperm(length(temp));
    
    neighbor(i,1:nb_num) = temp(index(1:nb_num));
    
end
    
neighbor = [[1:node_num]' neighbor];

end

