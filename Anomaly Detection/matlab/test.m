clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_nodes = 80;

Nnum_List = [4 8 12];

Group_List = char('c','b');

iter = 1;

pca_dim = 2;

kernel = 'poly';

kerneloption = 1;

theta = 0.2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

resultmat = [];
sesp = [];

for prob = 0.05 : 0.05 : 0.5
    
    [label data ] = synthetic( num_nodes, prob );
    
    onecol = [];
    sescol = [];
    
    for i = 1 : 3
        
        %tic
        
        nb_num = Nnum_List(i);
        acc2 = [];
        acc3 = [];
        
        for j = 1 : 2
        
            group_type = Group_List(j);
            
            cum_acc = 0;
            
            cum_se = 0;
            cum_sp = 0;
            
            for l = 1 : iter
                
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );
                
                cum_acc = cum_acc + (2*FF) / (2*FF+GF+FG);
                
                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);                
                
                clear GG GF FG FF;
                
            end
            
            acc = cum_acc / iter;
            
            acc2 = [acc2 acc];
            
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            acc3 = [acc3 se sp];

        end
        
        onecol = [onecol acc2];  
        sescol = [sescol acc3];
        
        %toc
        
    end

    resultmat = [resultmat onecol'];
    
    sesp = [sesp sescol'];
    
    clear data label;
    
end

result_matrix = resultmat

sesp

draw(result_matrix,'Test on synthetic data');
