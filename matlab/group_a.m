function neighbor = group_a( node_num, nb_num )

list = 1:node_num;

neighbor = zeros(node_num,nb_num);

for i = 1 : node_num
   
    list(list==i) = [];
    
    temp = list;
    
    count = 0;
    
    for j = 1 : nb_num
        
        if neighbor(i,j) ~= 0
            
            count = count + 1;
            
            temp(temp==neighbor(i,j)) = [];
            
        end
        
    end
    
    for k = 1 : node_num
        
        if size(find(neighbor(k,:)==0),2) == 0
            temp(temp==k) = [];
        end
        
    end
    
    if nb_num ~= count && length(temp)>=(nb_num-count)
        
        index = randperm(length(temp));
        
        index(1:nb_num-count)
        
        neighbor(i,count+1:nb_num) = temp(index(1:nb_num-count));
        
        for m = 1 : (nb_num-count)
            
            idx = temp(index(m));
            
            for n = 1 : nb_num
                
                if neighbor(idx,n) == 0
                    
                    neighbor(idx,n) = i;
                    
                    break;
                
                end
                
            end
                
        end
    
    end
    
end
    
neighbor = [[1:node_num]' neighbor];

end

