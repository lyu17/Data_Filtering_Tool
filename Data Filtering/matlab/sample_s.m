data = textread('data_ld10.txt');
 
clearvars -except data
 
col = size(data,2);
 
total_f = size(find(data(:,col)==1),1);
 
ff = fopen('sample_s_ld10.txt', 'w');
 
buff = [40 80 120 160 200];
t = [10 20 30 40 50];
m = [50 100 150 200 250 300];
pm = [0 1 2 3];

 
c_rate_list = [];
b_rate_list = [];
namelist = [];
 
for z1 = 1 : 6
    
    for z2 = 1 : 4
 
        idx = textread('cov_rank.txt');
 
        data_ranked = data(:,idx(1:m(z1)));
 
        mean_record = zeros(1,m(z1))-1;
        % var_record = zeros(1,m)-1;
 
        for i = 1 : 5
 
            buffer = buff(i);
 
            for j = 1 : 5
 
                threshold = t(j);
 
                iter = floor(20128/buffer);
                filename = strcat(num2str(buffer),'_',num2str(threshold),'_',num2str(m(z1)),'_',num2str(pm(z2)),'.txt')
 
%               fprintf(ff,'%s\n',filename);
 
%               fid = fopen(filename, 'w');
 
                loss_sum = 0;
                selec_sum = 0;
 
                for k = 0 : iter
 
                    startIdx = k * buffer + 1;
                    endIdx = ( k + 1 ) * buffer;
 
                    if endIdx > 20128
                        endIdx = 20128;
                    end
 
                    selected = [];
 
                    for k1 = startIdx : endIdx
 
                        mean_count = 0;
                        instance = data_ranked(k1,:);
 
                        for k2 = 1 : m(z1)
 
                            [abs(instance(k2)-mean_record(k2)) abs(mean_record(k2))];
 
                            mean_change = abs(instance(k2)-mean_record(k2))/abs(mean_record(k2));
 
                            if mean_change > (threshold / 100)
 
                                mean_count = mean_count + 1;
 
                            end
 
                        end
 
                        if mean_count > pm(z2)
                            selected = [selected;k1];
                        end
 
                    end
 
        %            S = data(selected,:);
        %            [r c] = size(S);
        %            for u = 1 : r
        %                for v = 1 : c-1
        %                    fprintf(fid,'%f ',S(u,v));
        %                end
        %                fprintf(fid,'%d\n',S(u,c));
        %            end
 
                    num_select = size(find(data(selected,col)==1),1);
                    num_failure = size(find(data(startIdx:endIdx,col)==1),1);
 
        %           [num_failure num_select];
                    loss_sum = loss_sum + ( num_failure - num_select );
 
                    mean_record = mean(data(startIdx:endIdx,idx(1:m(z1))));
 
                    selec_sum = selec_sum + size(selected,1);
 
                end
                
                c_rate = selec_sum / 20128;
                b_rate = (total_f-loss_sum) / total_f;
 
%               sat = [selec_sum c_rate (751-loss_sum) b_rate];
                
%               fprintf(ff,'%d %f %d %f\n',selec_sum,c_rate,(751-loss_sum),b_rate);
                
                c_rate_list = [c_rate_list;c_rate];
                b_rate_list = [b_rate_list;b_rate];
                namelist = [ namelist; buffer threshold m(z1) pm(z2) ];
 
%               fclose(fid);
 
            end
 
        end
 
    end
end


clearvars -except data c_rate_list b_rate_list namelist ff

len = size(c_rate_list,1);
max_b_rate_1 = 0;
max_b_rate_2 = 0;
max_b_rate_3 = 0;
max_b_rate_4 = 0;
maxname1 = [];
maxname2 = [];
maxname3 = [];
maxname4 = [];



for k = 1 : len
    fprintf(ff,'%f %f %d %d %d %d\n',c_rate_list(k),b_rate_list(k),namelist(k,1),namelist(k,2),namelist(k,3),namelist(k,4));
    if c_rate_list(k) > 0.17 && c_rate_list(k) < 0.23 && max_b_rate_1 < b_rate_list(k)
        max_b_rate_1 = b_rate_list(k);
        maxname1 = namelist(k,:);
    elseif c_rate_list(k) > 0.37 && c_rate_list(k) < 0.43 && max_b_rate_2 < b_rate_list(k)
        max_b_rate_2 = b_rate_list(k);
        maxname2 = namelist(k,:);
    elseif c_rate_list(k) > 0.57 && c_rate_list(k) < 0.63 && max_b_rate_3 < b_rate_list(k)
        max_b_rate_3 = b_rate_list(k);
        maxname3 = namelist(k,:);
    elseif c_rate_list(k) > 0.77 && c_rate_list(k) < 0.83 && max_b_rate_4 < b_rate_list(k)
        max_b_rate_4 = b_rate_list(k);
        maxname4 = namelist(k,:);
    end
end

[max_b_rate_1 maxname1]
[max_b_rate_2 maxname2]
[max_b_rate_3 maxname3]
[max_b_rate_4 maxname4]

fclose(ff);