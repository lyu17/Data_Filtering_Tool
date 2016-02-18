clear;
clc;

Fault_List = char('nl_cpuhog','nl_memleak','nl_nethog','nl_diskhog','nl_cpumem','nl_netdisk','wc_cpuhog','wc_memleak','wc_nethog','wc_diskhog','wc_cpumem','wc_netdisk','ts_cpuhog','ts_memleak','ts_nethog','ts_diskhog','ts_cpumem','ts_netdisk');

Prob_List = char('10','20','30','40');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nb_num = 8;

method = 'vote';

group_type = 'b';

threshold = [0.20 0.25 0.35 0.75 0.25 0.75 0.40 0.25 0.35 0.75 0.30 0.75 0.60 0.15 0.15 0.60 0.35 0.70];

pca_dim = 2;

kernel = 'poly';

kerneloption = 1;

it = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i = 1 : 18
   
    fault = Fault_List(i,:);
    theta = threshold(i);
    path = strcat('C:\Users\Yu\Desktop\logs\',fault,'_');
    
    resultmat = [];
    
    for j = 1 : 4
        
        data_log = strcat(path,Prob_List(j,:),'\feature_hec-');
       
        fault_log = strcat(path,Prob_List(j,:),'\label');
        
        [data label] = dataload( data_log, fault_log, fault );
        
        onecol = [];
        
        cum_se = 0;
        
        cum_sp = 0;
        
        for l = 1 : it
            
            [ GG GF FG FF rand ] = detection( data, nb_num, group_type, method, theta, label, pca_dim, kernel, kerneloption );
            
            cum_se = cum_se + FF / (FF + FG);
            cum_sp = cum_sp + GG / (GF + GG);
            
            clear GG GF FG FF rand;
        end
        
        se = cum_se / it;
        
        sp = cum_sp / it;
        
        resultmat = [resultmat [se sp]'];

    end

    i
    result_matrix = resultmat

    clearvars -EXCEPT i it Fault_List Prob_List nb_num method group_type threshold pca_dim kernel kerneloption
    
end

