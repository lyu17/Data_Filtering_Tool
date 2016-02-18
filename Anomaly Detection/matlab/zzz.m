clear;
clc;

path = strcat('C:\Users\Yu\Desktop\logs\wc_memleak_');

Prob_List = char('05','10','15','20','25','30','35','40','45','50');

node_list = 1:63;
node_list(node_list==5) = [];

for k = 3 : 3
    
    data_log = strcat(path,Prob_List(k,:),'\feature_hec-');
    
    fault_log = strcat(path,Prob_List(k,:),'\label');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fault_node = importdata(fault_log);
    
    label = zeros(1,62) + 1;
    
    for i = 1 : length(fault_node)
        if fault_node(i) < 5
            label(fault_node(i)) = label(fault_node(i)) - 2;
        else
            label(fault_node(i)-1) = label(fault_node(i)-1) - 2;
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    data = zeros(16,62);
    
    max_stat = [];
    avg_stat = [];
    lab_stat = [];

    for i = 1 : 62

        if node_list(i) < 10
            file_name = strcat(data_log,'0',num2str(node_list(i)),'.log');
        else
            file_name = strcat(data_log,num2str(node_list(i)),'.log');
        end

        raw_data = importdata(file_name);
        
        [row col] = size(raw_data);
        
        data = raw_data(:,2:col);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        max_data = max(data);
        
        max_stat = [max_stat;max_data];
        
        avg_data = mean(data);
        
        avg_stat = [avg_stat;avg_data];
        
        lab_data = mean(data);
        
        lab_data(11:16) = min(data(:,11:16));
        
        if label(i) == 1
            lab_data(4) = max(data(:,4));
        else
            lab_data(4) = min(data(:,4));
        end
        
        lab_stat = [lab_stat;lab_data];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end
    
    max_stat = [label' max_stat];
    
    avg_stat = [label' avg_stat];
    
    lab_stat = [label' lab_stat];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
end
        
















