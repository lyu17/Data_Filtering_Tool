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

thetas = [0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2] - 0.1;

probs = [0.1 0.2 0.3 0.4];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

resultmat1 = [];

resultmat2 = [];

resultmat3 = [];

resultmat4 = [];

for i = 11 : 11
    
    theta = thetas(i);
    
    if i == 1
        
        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_wc1( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat1 = [resultmat1 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes

    elseif i == 2
        
        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_ts1( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat1 = [resultmat1 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes

    elseif i == 3

        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_xx1( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat1 = [resultmat1 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes

    elseif i == 4
        
        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_wc2( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat2 = [resultmat2 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes
        
    elseif i == 5
        
        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_ts2( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat2 = [resultmat2 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes
        
    elseif i == 6   

        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_xx2( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat2 = [resultmat2 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes        

    elseif i == 7

        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_wc3( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat3 = [resultmat3 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes         
        
    elseif i == 8
        
        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_ts3( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat3 = [resultmat3 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes 
    
    elseif i == 9

        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_xx3( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat3 = [resultmat3 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes 
        
    elseif i == 10
       
        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_wc4( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat4 = [resultmat4 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes 
        
    elseif i == 11

        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_ts4( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat4 = [resultmat4 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes 
        
    elseif i == 12   

        for j = 1 : 4
            
            prob = probs(j);
            
            [ label data ] = data_xx4( num_nodes, prob );
            
            onecol = [];
            cum_se = 0;
            cum_sp = 0;
            se = 0;
            sp = 0;
            
            for l = 1 : iter
            
                [ GG GF FG FF rand ] = detection( data, nb_num, group_type, 'vote', theta, label, pca_dim, kernel, kerneloption );

                cum_se = cum_se + FF / (FF + FG);
                cum_sp = cum_sp + GG / (GF + GG);

                clear GG GF FG FF;
        
            end
        
            se = cum_se / iter;
            sp = cum_sp / iter;
        
            resultmat4 = [resultmat4 [se sp]'];
            
        end
        
        clearvars -EXCEPT i iter probs nb_num method group_type theta pca_dim kernel kerneloption resultmat* num_nodes 
        
    end
    
end

resultmat1

resultmat2

resultmat3

resultmat4