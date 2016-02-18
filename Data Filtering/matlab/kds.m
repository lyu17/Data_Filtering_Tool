% function Sample_KD( data, lead_time, buff_size, bin_size, sp, num_f )

data = textread('data_ld10.txt');

order = textread('cov_rank.txt');

clearvars -except data order table1 table2 table3 table4 table5 table6 table7 table8 table9 

sp = 0.9;

bl = [160 120 120 120];
bs = [20 28 8 4];
sr = [20 28 4 2];
nf = [80 100 100 100];
cr = [20 40 60 80];

col = size(data,2);

total_fail = size(find(data(:,col)==1),1)

for u = 1 : 1
   
    buff_size = bl(u);
    bin_size = bs(u);
%   sample_rate = sr(u);
    num_f = nf(u);
    
    fid = fopen(strcat('K_',num2str(cr(u)),'.txt'), 'w');
    frd = fopen(strcat('K_',num2str(cr(u)),'_record.txt'), 'w');
    
    iter = floor(20128/buff_size);
    entry_name = strcat(num2str(buff_size),'_',num2str(bin_size),'_',num2str(sr(u)),'_',num2str(num_f))
    fprintf(frd,'%s\n',entry_name);
    
    loss_sum = 0;
    selec_sum = 0;
    
    c_sum = zeros(1,num_f);
    
    for k = 0 : iter 
    
        startIdx = k * buff_size + 1;
        endIdx = (k+1)*buff_size;

        if endIdx > 20128
            endIdx = 20128;
        end

        X = data(startIdx:endIdx,:);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        idxs = 1;
        idxf = 1;

        m = size(X,1);
        id = 1;

        p = queue();
        store = queue();

        s(idxs) = struct('ID',id,'vectors',X,'layer',1,'size',m,'type','node');
        id = id + 1;
        idxs = idxs + 1;

        p = comein(p,s(idxs-1));

        while ~isempty(p)

            [d node] = goout(p);
            num = node.size;
            layer = node.layer;

            if num > bin_size

                store = comein(store,node);

                dim = order(layer);

                vec = node.vectors; 

                left = vec(find(vec(:,dim)>sp*median(vec(:,dim))),:);
                size_left = size(left,1);

                right = vec(find(vec(:,dim)<=sp*median(vec(:,dim))),:);
                size_right = size(right,1);

                s(idxs) = struct('ID',id,'vectors',left,'layer',layer+1,'size',size_left,'type','node');
                id = id + 1;
                idxs = idxs + 1;
                p = comein(p,s(idxs-1));

                s(idxs) = struct('ID',id,'vectors',right,'layer',layer+1,'size',size_right,'type','node');
                id = id + 1;
                idxs = idxs + 1;
                p = comein(p,s(idxs-1));

            else

                node.type = 'leaf';
                store = comein(store,node);

            end

        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        c_sum = c_sum + sum(data(startIdx:endIdx,order(1:num_f)));

        c_mean = c_sum/((k+1)*buff_size);

        current_mean = mean(data(startIdx:endIdx,order(1:num_f)));

        e_flag = 0;

        for i = 1 : num_f

            if c_mean(i) ~= 0
                change_rate = abs(abs(current_mean(i))-abs(c_mean(i))) / abs(c_mean(i));
            else
                change_rate = 1;
            end

            if change_rate > 0.5

                e_flag = e_flag + 1;

            end

        end

        sample_rate = sr(u);

        if e_flag >= 2
            sample_rate = 1;
        elseif e_flag >= 1
            sample_rate = 2;
        end

        mean_record = current_mean;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        tf = size(find(X(:,col)==1),1);
        sf = 0;

        while ~isempty(store)

            [d node] = goout(store);

            if strcmp(node.type,'leaf')

                vector = node.vectors;
                row = size(vector,1);

                if row ~= 0

                    randomseq = randperm(row);
                    idx = randomseq(1:row);

                    if sample_rate == 1
                        ss = row;
                    else
                        ss = floor(row/sample_rate)+1; 
                    end

                    sampled_instance = vector(idx(1:ss),:);

                    fail = size(find(sampled_instance(:,col)==1),1); 
                    sf = sf + fail;

                    selec_sum = selec_sum + size(sampled_instance,1);

                    for i = 1 : ss
                        for j = 1 : col-1
                            fprintf(fid,'%f ',sampled_instance(i,j));
                        end
                        fprintf(fid,'%d\n',sampled_instance(i,col));
                    end

                end
            end
        end

        it_left = iter - (k + 1);
        loss_sum = loss_sum + ( tf - sf );

    end
    
    c_rate = selec_sum / 20128;
    b_rate = (total_fail-loss_sum) / total_fail;
    sat = [selec_sum c_rate (total_fail-loss_sum) b_rate]
    fprintf(frd,'%d %f %d %f\n',selec_sum,c_rate,(total_fail-loss_sum),b_rate);
    
    fclose(fid);
    fclose(frd);
    
end


