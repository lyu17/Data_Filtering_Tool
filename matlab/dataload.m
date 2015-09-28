function [data label] = dataload( data_log, fault_log, type )

node_list = 1:63;
node_list(node_list==5) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fault_node = importdata(fault_log);
label = zeros(1,62) + 1;

sub = 2;

for i = 1 : length(fault_node)
    
    if fault_node(i) == 0
        sub = 3;
        continue;
    end
    
    if fault_node(i) < 5
        label(fault_node(i)) = label(fault_node(i)) - sub;
    else
        label(fault_node(i)-1) = label(fault_node(i)-1) - sub;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% row = size(featurelist,2);

data = zeros(16,62);

for i = 1 : 62
    
    if node_list(i) < 10
        file_name = strcat(data_log,'0',num2str(node_list(i)),'.log');
    else
        file_name = strcat(data_log,num2str(node_list(i)),'.log');
    end
    
    raw_data = importdata(file_name);
    
    node_data = normdata(raw_data(:,2:size(raw_data,2)),type,label(i));
    
    data(:,i) = node_data';

%   data(:,i) = (sum(node_data(1:sample_num,featurelist),1)/size(node_data(1:sample_num,featurelist),1))';
    
end

end