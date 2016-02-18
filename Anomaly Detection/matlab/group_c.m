function neighbor = group_c( node_num, nb_num )

gp_num = floor(node_num/(nb_num+1));
re_num = mod(node_num,(nb_num+1));

neighbor = zeros(node_num,nb_num);

for i = 1 : gp_num
    
    member = (1:(nb_num+1))+(i-1)*(nb_num+1);
    
    for j = 1 : (nb_num+1)
        temp = member;
        temp(temp==(i-1)*(nb_num+1)+j) = [];
        neighbor((i-1)*(nb_num+1)+j,:) = temp;
    end
    
end
    
member = (1:re_num)+gp_num*(nb_num+1);

for j = 1 : re_num
    temp = member;
    temp(temp==gp_num*(nb_num+1)+j) = [];
    temp = [temp 1:(nb_num-re_num+1)];
    neighbor(gp_num*(nb_num+1)+j,:) = temp;
end

neighbor = [[1:node_num]' neighbor];

end