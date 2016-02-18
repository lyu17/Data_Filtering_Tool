clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_nodes = 80;

Nnum_List = [4 8 12];

Group_List = char('b','c');

iter = 20;

pca_dim = 2;

kernel = 'poly';

kerneloption = 1;

% theta = 0.8;

theta = 0.2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rand_km = [];
rand_hc = [];
rand_km_o = [];
rand_hc_o = [];
rand_ms = [];

group_by_km = [];
group_by_hc = [];
group_by_km_o = [];
group_by_hc_o = [];
group_by_ms = [];

lgroup = [];

for prob = 0.05 : 0.05 : 0.5
    
    [label data ] = data_ts2( num_nodes, prob );
    
    for i = 1 : iter
        
        neighbor = group_b( num_nodes, Nnum_List(2) );
        
        gp_num = size(neighbor,1);
        
        nb_num = size(neighbor,2)-1;
        
        cgroup = [];
        
        lgroup = [];
        
%        for k = 1 : gp_num
            
%            group = data(:,neighbor(k,:));
            
%            group = kpca(group,pca_dim,kernel,kerneloption);
            
%            if size(group,1) == 1
%                group = [group;zeros(1,size(group,2))];
%            end
            
%            data_kpca = kpca(data,pca_dim,kernel,kerneloption);

             data_kpca = data_pca(data,pca_dim);
            
%           [neighbor(k,:);label(neighbor(k,:));group]
            
            % k means clusting
            idx_km = kmeans(data_kpca',2);
            idx_km = idx_km';
            
            idx_km_o = kmeans(data_kpca',3,'emptyaction','drop');
            idx_km_o = idx_km_o';
            
            % hierarchical clustering
            idx_hc = clusterdata(data_kpca','maxclust',2);
            idx_hc = idx_hc';
            
            idx_hc_o = clusterdata(data_kpca','maxclust',3);
            idx_hc_o = idx_hc_o';
            
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            mindis = inf;

            for i1 = 1 : 80
                for i2 = 80
                    dis = sqrt(sum((data_kpca(:,i1)-data_kpca(:,i2)).^2));
                    if label(i1) ~= label(i2) && dis < mindis
                        mindis = dis;
                    end
                end
            end

%           theta = mindis;

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % mean-shift clustering
            [c_cent,idx_ms,m_cell] = MeanShiftCluster(data_kpca,theta);
%           mindis
            
%           [neighbor(k,:);label(neighbor(k,:));group;idx_hc]
            
%            lgroup = [lgroup;label(neighbor(k,:))];
            
            group_by_km = [group_by_km;idx_km];
            
            group_by_km_o = [group_by_km_o;idx_km_o];
            
            group_by_hc = [group_by_hc;idx_hc];
            
            group_by_hc_o = [group_by_hc_o;idx_hc_o];
            
            group_by_ms = [group_by_ms;idx_ms];
            
%        end
        
        rand_km = [ rand_km cluster_acc( label, group_by_km ) ];
        
        rand_km_o = [ rand_km_o cluster_acc( label, group_by_km_o ) ];
        
        rand_hc = [ rand_hc cluster_acc( label, group_by_hc ) ];
        
        rand_hc_o = [ rand_hc_o cluster_acc( label, group_by_hc_o ) ];
        
        rand_ms = [ rand_ms cluster_acc( label, group_by_ms ) ];
        
        lgroup = [];
        group_by_km = [];
        group_by_km_o = [];
        group_by_hc = [];
        group_by_hc_o = [];
        group_by_ms = [];
        
    end
    
end

% [rand_km;rand_hc;rand_km_o,rand_hc_o,rand_ms];

km_acc_avg = mean(rand_km);
km_acc_var = var(rand_km);

kmo_acc_avg = mean(rand_km_o);
kmo_acc_var = var(rand_km_o);

hc_acc_avg = mean(rand_hc);
hc_acc_var = var(rand_hc);

hco_acc_avg = mean(rand_hc_o);
hco_acc_var = var(rand_hc_o);

ms_acc_avg = mean(rand_ms);
ms_acc_var = var(rand_ms);

means = [km_acc_avg kmo_acc_avg hc_acc_avg hco_acc_avg ms_acc_avg]
vars = [km_acc_var kmo_acc_var hc_acc_var hco_acc_var ms_acc_var]

draw_cluster_acc(means,vars);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [label n_data neighbor] = ts1( 0.1, 'b', 5 );

% [label;n_data];

% neighbor

%datapca = data_pca( n_data, 2 );

%datakpca = kpca(n_data,2,'poly',1);

% T = clusterdata(datapca','maxclust',2);

% T = kmeans(datapca',2);

% [clustCent,T,clustMembsCell] = MeanShiftCluster(datapca,0.1);
   
%[label; T'; datapca]
