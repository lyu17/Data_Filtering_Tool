clear;
clc;

Fault_List = char('nl_cpuhog','nl_memleak','nl_nethog','nl_diskhog','nl_cpumem','nl_netdisk','wc_cpuhog','wc_memleak','wc_nethog','wc_diskhog','wc_cpumem','wc_netdisk','ts_cpuhog','ts_memleak','ts_nethog','ts_diskhog','ts_cpumem','ts_netdisk');

Prob_List = char('05','10','15','20','25','30','35','40','45','50');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nb_num = 8;

group_type = 'b';

threshold_v = [0.20 0.25 0.35 0.75 0.25 0.75 0.40 0.25 0.35 0.75 0.30 0.75 0.60 0.15 0.15 0.60 0.35 0.70];

% threshold_d = [5.00 5.00 5.00 5.00 5.00 5.00 5.00 5.00 5.00 5.00 5.00 2.00 5.00 5.00 5.00 5.00 5.00 5.00];

threshold_d = threshold_v * 1.5;

pca_dim = 2;

kernel = 'poly';

kerneloption = 1;

it = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i = 12 : 12
   
    fault = Fault_List(i,:);
    theta_v = threshold_v(i);
    theta_d = threshold_d(i);
    path = strcat('C:\Users\Yu\Desktop\logs\',fault,'_');
    
    resultmat = [];
    
    for j = 1 : 10
        
        data_log = strcat(path,Prob_List(j,:),'\feature_hec-');
       
        fault_log = strcat(path,Prob_List(j,:),'\label');

        [data label] = dataload( data_log, fault_log, fault );
        
        cum_va = 0;
        
        cum_da1 = 0;
        
        cum_da2 = 0;
        
        for l = 1 : it
            
            [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta_v, label, pca_dim, kernel, kerneloption );
            
            cum_va = cum_va + (2*FF) / (2*FF+GF+FG);
            
            clear GG GF FG FF rand;

 %          [ GG GF FG FF rand ] = detection( data, 61, group_type, 'deviation', theta_d, label, pca_dim, kernel, kerneloption );
            
 %          cum_da1 = cum_da1 + (2*FF) / (2*FF+GF+FG);
            
%           clear GG GF FG FF rand;
            
            [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'deviation', theta_d, label, pca_dim, kernel, kerneloption );
            
            cum_da2 = cum_da2 + (2*FF) / (2*FF+GF+FG);
            
            clear GG GF FG FF rand;
            
        end
        
        va = cum_va / it;
        
%       da1 = cum_da1 / it;
        
        da2 = cum_da2 / it;
        
        resultmat = [resultmat;[va da2]];

    end

    result_matrix = resultmat
    
    draw1(result_matrix);

    clearvars -EXCEPT i it Fault_List Prob_List nb_num group_type threshold pca_dim kernel kerneloption
    
end


