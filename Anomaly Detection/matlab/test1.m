clear;
clc;

Fault_List = char('nl_cpuhog','nl_memleak','nl_nethog','nl_diskhog','nl_cpumem','nl_netdisk','wc_cpuhog','wc_memleak','wc_nethog','wc_diskhog','wc_cpumem','wc_netdisk','ts_cpuhog','ts_memleak','ts_nethog','ts_diskhog','ts_cpumem','ts_netdisk');

Prob_List = char('05','10','15','20','25','30','35','40','45','50');

Nnum_List = [4 8 12];

Group_List = char('b','c');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

method = 'vote';

threshold = [0.20 0.25 0.35 0.75 0.25 0.75 0.40 0.25 0.35 0.75 0.30 0.75 0.60 0.15 0.15 0.60 0.35 0.70];

pca_dim = 2;

kernel = 'poly';

kerneloption = 1;

it = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i = 1 : 18
   
    fault = Fault_List(i,:);
    theta = threshold(i);
    path = strcat('C:\Users\Yu\Desktop\logs\',fault,'_');
    
    resultmat = [];
    timemat = [];
    randmat = [];
    
    for j = 1 : 10
        
        data_log = strcat(path,Prob_List(j,:),'\feature_hec-');
       
        fault_log = strcat(path,Prob_List(j,:),'\label');
        
        [data label] = dataload( data_log, fault_log, fault );
        
        onecol = [];
        timcol = [];
        randcol = [];
        
        for k1 = 1 : 3
            
            nb_num = Nnum_List(k1);
            
            ran2 = [];
            
            for k2 = 1 : 2
                
                group_type = Group_List(k2);
                
                cum_rand = 0;
                
                for l = 1 : it
                    
                    [ GG GF FG FF rand ] = detection( data, nb_num, group_type, method, theta, label, pca_dim, kernel, kerneloption );
                    
                    cum_rand = cum_rand + rand;
                    
                    clear GG GF FG FF rand;
       
                end
                
                rand_avg = cum_rand / it;
                
                ran2 = [ran2 rand_avg];
                
            end

            randcol = [randcol ran2];
            
        end

        randmat = [randmat randcol'];
        
        clear data_log fault_log data label;
    
    end
    
    cluster_acc = randmat;
    cluster_acc = sum(cluster_acc,2)/10;
    n2 = (cluster_acc(1) + cluster_acc(2))/2;
    n4 = (cluster_acc(3) + cluster_acc(4))/2;
    n16 = (cluster_acc(5) + cluster_acc(6))/2;
    cluster_acc = [n2 n4 n16]
    
    clearvars -EXCEPT i Fault_List Prob_List Nnum_List Group_List method threshold pca_dim kernel kerneloption it
end


