clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_nodes = 80;

nb_num = 8;

group_type = 'b';

iter = 20;

pca_dim = 2;

kernel = 'poly';

kerneloption = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

theta_dev = 0.5;

theta_dev1 = 0.1;

theta_vot_k2 = 2;

theta_vot_pca = 0.2;

theta_vot = 0.5;

theta_vot_nf = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

resultmat = [];

for prob = 0.05 : 0.05 : 0.5
    
    [label data ] = data_ts1( num_nodes, prob );
    
    cum_vot = 0;
    cum_dev = 0;
    cum_dev1 = 0;
    cum_vot_k2 = 0;
    cum_vot_pca = 0;
    cum_vot_nf = 0;
    
    for l = 1 : iter
        
        [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta_vot, label, pca_dim, kernel, kerneloption );        
        cum_vot = cum_vot + (2*FF) / (2*FF+GF+FG);        
        clear GG GF FG FF;
        
        [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'deviation', theta_dev, label, pca_dim, kernel, kerneloption );        
        cum_dev = cum_dev + (2*FF) / (2*FF+GF+FG);       
        clear GG GF FG FF;
        
        [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'deviation1', theta_dev1, label, pca_dim, kernel, kerneloption );        
        cum_dev1 = cum_dev1 + (2*FF) / (2*FF+GF+FG);      
        clear GG GF FG FF;
        
        [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote_k2', theta_vot_k2, label, pca_dim, kernel, kerneloption );        
        cum_vot_k2 = cum_vot_k2 + (2*FF) / (2*FF+GF+FG);       
        clear GG GF FG FF;
        
        [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote_pca', theta_vot_pca, label, pca_dim, kernel, kerneloption );        
        cum_vot_pca = cum_vot_pca + (2*FF) / (2*FF+GF+FG);      
        clear GG GF FG FF;
        
        [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote_nf', theta_vot_pca, label, pca_dim, kernel, kerneloption );        
        cum_vot_nf = cum_vot_nf + (2*FF) / (2*FF+GF+FG);      
        clear GG GF FG FF;
    
    end
    
    avg_vot = cum_vot / iter;
    
    avg_dev = cum_dev / iter;
    
    avg_dev1 = cum_dev1 / iter;
    
    avg_vot_k2 = cum_vot_k2 / iter;
    
    avg_vot_pca = cum_vot_pca / iter;
    
    avg_vot_nf = cum_vot_nf / iter;
    
    resultmat = [resultmat;[avg_dev avg_dev1 avg_vot_k2 avg_vot_nf avg_vot_pca avg_vot]];
    
end

result_matrix = resultmat;

result_matrix([2 4 6 8],:)

draw1(result_matrix);
