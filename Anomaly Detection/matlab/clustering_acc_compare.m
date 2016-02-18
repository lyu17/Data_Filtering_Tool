clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_nodes = 128;
iter = 1;
pca_dim = 2;
theta = 0.2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rand_km = [];
rand_hc = [];
rand_gm = [];
rand_db = [];
rand_ms = [];
rand_am = [];

group_km = [];
group_hc = [];
group_gm = [];
group_db = [];
group_ms = [];
group_am = [];

for prob = 0.05 : 0.05 : 0.45
    
    [label data ] = data_ts4( num_nodes, prob );
    
    for i = 1 : iter
        
        data_prj = data_pca(data,pca_dim);
        
        % k means clusting
        idx_km = kmeans(data_prj',2);
        idx_km = idx_km';
        rand_km = [rand_km cluster_acc(label,idx_km)];
        
        % hierarchical clustering
        idx_hc = clusterdata(data_prj','maxclust',2);
        idx_hc = idx_hc';
        rand_hc = [rand_hc cluster_acc(label,idx_hc)];
        
        % gaussian mixture
        gm = fitgmdist(data_prj',2);
        idx_gm = cluster(gm,data_prj');
        idx_gm = idx_gm';
        rand_gm = [rand_gm cluster_acc(label,idx_gm)];
        
        % dbscan
        [c idx_db] = dbscan(data_prj, 0.2, 5);
        idx_db = idx_db';
        rand_db = [rand_db cluster_acc(label,idx_db)];
        
        % mean-shift
        [c_cent,idx_ms] = MeanShiftCluster(data_prj,0.2);
        rand_ms = [rand_ms cluster_acc(label,idx_ms)];
        
        % AMS
        [c_cent,idx_am] = MeanShiftCluster(data_prj,0.1);
        rand_am = [rand_am cluster_acc(label,idx_am)];
            
        
    end
    
end

km_avg = mean(rand_km);
hc_avg = mean(rand_hc);
gm_avg = mean(rand_gm);
db_avg = mean(rand_db);
ms_avg = mean(rand_ms);
am_avg = mean(rand_am);

[km_avg hc_avg gm_avg db_avg ms_avg am_avg]