function [ GG GF FG FF ] = deviation( data, neighbor, theta_d, label, pca_dim, kernel, kerneloption )

col = size(data,2);

F_state = zeros(1,col);

gp_mum = size(neighbor,1);
nb_num = size(neighbor,2)-1;

%begin%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k = 1 : gp_mum
    
    group = data(:,neighbor(k,:));    
    
    group = kpca(group,pca_dim,kernel,kerneloption);
    
    [D T] = dev_test( group(:,1), group(:,2:nb_num+1), theta_d );
    
    if T == 0
        F_state(k) = 1;
    else
        F_state(k) = -1;
    end

end

%end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

GG = 0;

GF = 0;

FG = 0;

FF = 0;

for k = 1 : gp_mum
    
    if label(k) == 1
        
        if F_state(k) == 1
            GG = GG + 1;
        else
            GF = GF + 1;
        end
        
    else
        
        if F_state(k) == 1
            FG = FG + 1;
        else
            FF = FF + 1;
        end
        
    end
    
end

end