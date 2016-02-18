data = textread('ovis.txt');

idx = textread('cov_rank.txt');

clearvars -except data idx

bl = [15 20 25 20];
tl = [50 50 30 50];
ml = [50 50 50 100];
pl = [2 1 1 3];
cr = [20 40 60 80];
col = size(data,2);
 
total_f = size(find(data(:,col)==1),1);

for j = 1 : 4
   
    buff_size = bl(j);
    threshold = tl(j);
    f_num = ml(j);
    c_num = pl(j);
    
    fid = fopen(strcat('S_',num2str(cr(j)),'.txt'), 'w');
    frd = fopen(strcat('S_',num2str(cr(j)),'_record.txt'), 'w');
    
    data_ranked = data(:,idx(1:f_num));
    mean_record = zeros(1,f_num)-1;
    
    iter = floor(3210/buff_size);
    entry_name = strcat(num2str(buff_size),'_',num2str(threshold),'_',num2str(f_num),'_',num2str(c_num))
    fprintf(frd,'%s\n',entry_name);
    
    loss_sum = 0;
    selec_sum = 0;
    
    for k = 0 : iter
        
        startIdx = k * buff_size + 1;
        endIdx = ( k + 1 ) * buff_size;
        
        if endIdx > 3210
            endIdx = 3210;
        end
        
        selected = [];
        
        for k1 = startIdx : endIdx
            
            mean_count = 0;
            instance = data_ranked(k1,:);
            
            for k2 = 1 : f_num
                
                [abs(instance(k2)-mean_record(k2)) abs(mean_record(k2))];
                
                mean_change = abs(instance(k2)-mean_record(k2))/abs(mean_record(k2));
                
                if mean_change > (threshold / 100)
                    
                    mean_count = mean_count + 1;
                
                end
                
            end
            
            if mean_count > c_num
                
                selected = [selected;k1];
            
            end
            
        end
        
        S = data(selected,:);
        [r c] = size(S);
        for u = 1 : r
            for v = 1 : c-1
                fprintf(fid,'%f ',S(u,v));
            end
            fprintf(fid,'%d\n',S(u,c));
        end
        
        num_select = size(find(data(selected,col)==1),1);
        num_failure = size(find(data(startIdx:endIdx,col)==1),1);
        
        loss_sum = loss_sum + ( num_failure - num_select );
        
        mean_record = mean(data(startIdx:endIdx,idx(1:f_num)));
        
        selec_sum = selec_sum + size(selected,1);
    
    end
    
    c_rate = selec_sum / 3210;
    b_rate = (total_f-loss_sum) / total_f;
    sat = [selec_sum c_rate (total_f-loss_sum) b_rate]
    fprintf(frd,'%d %f %d %f\n',selec_sum,c_rate,(total_f-loss_sum),b_rate);
 
    fclose(fid);
    fclose(frd);

end

