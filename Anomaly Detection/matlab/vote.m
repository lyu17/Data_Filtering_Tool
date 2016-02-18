function [ GG GF FG FF rand ] = vote( data, neighbor, theta_s, label, pca_dim, kernel, kerneloption )

col = size(data,2);

I_state = zeros(1,col);
F_state = zeros(1,col);

gp_num = size(neighbor,1);
nb_num = size(neighbor,2)-1;

cgroup = [];
lgroup = [];

%threshold%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%data;

%fault = find(label==-1);

%good = find(label==1);

%gg = sqrt(sum((data(:,good(1))-data(:,good(2))).^2));

%ff = sqrt(sum((data(:,fault(1))-data(:,fault(2))).^2));

%gf = sqrt(sum((data(:,good(1))-data(:,fault(1))).^2));


%Phase1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k = 1 : gp_num
    
    group = data(:,neighbor(k,:));
    
    group = kpca(group,pca_dim,kernel,kerneloption);
    
    if size(group,1) == 1
        group = [group;zeros(1,size(group,2))];
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    mindis = inf;
    mindis_c = inf;
    
    for i1 = 1 : nb_num+1
        for i2 = 1 : nb_num+1
            lb = label(neighbor(k,:));
            dis = sqrt(sum((group(:,i1)-group(:,i2)).^2));
            if lb(i1) ~= lb(i2) && dis < mindis_c
                mindis_c = dis;
            end
            if i1 == 1 && i2~=1 && dis < mindis
                mindis = dis;
            end
        end
    end
    
    mindis = avg_distance( group, nb_num );
   
    dice = randperm(10);
    
%    if dice(1) ~= 1 %&& dice(1) ~= 2
        theta_s = mindis_c * 0.9;
%    end
    
%    if theta_s > ntheta
%        theta_s = ntheta;
%    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [clustCent,point2cluster,clustMembsCell] = ams(group,theta_s);
    
%    [neighbor(k,:);label(neighbor(k,:));group;point2cluster]
    
    mindis_c;
    
    mindis;
    
    lgroup = [lgroup;label(neighbor(k,:))];
    
    cgroup = [cgroup;point2cluster];
    
    pcagroup(:,:,k) = group;
    
    count = 0;
    
    for i = 2 : nb_num+1
        
        if point2cluster(1) == point2cluster(i)
            count = count + 1;
        end
        
    end
    
    if count > floor(nb_num/2)
        I_state(k) = 1;
    else
        I_state(k) = -1;
    end

end

%ClusteringAcc%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%rand = cluster_acc( lgroup, cgroup )

rand = 0;

%Phase2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k = 1 : gp_num
    
    group = pcagroup(:,:,k);
    
    m_num = 0;
    count = 0;
    
    for i = 2 : nb_num+1
        
        if I_state(neighbor(k,i)) == 1 
            
            m_num = m_num + 1;
            
            if cgroup(k,1) == cgroup(k,i)
                count = count + 1;
            end
            
        end
        
    end
    
    if m_num == 0
        
        if I_state(k) == 1
            F_state(k) = 1;
        else
            F_state(k) = -1;
        end
        
    else
        
        if count > floor(m_num/2)
            F_state(k) = 1;
        else
            F_state(k) = -1;
        end
        
    end

end

%Voteend%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

GG = 0;

GF = 0;

FG = 0;

FF = 0;

for k = 1 : gp_num
    
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

%[label;F_state]

end