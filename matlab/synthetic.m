function [label n_data ] = synthetic( num_nodes, f_probs )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_a_node = 3;

num_f_pattern = 1;

label = ones ( 1, num_nodes );

data = zeros ( 16, num_nodes );

n_data = zeros ( 16, num_nodes );

f_nodes = round (num_nodes * f_probs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% raw_data = importdata('C:\Users\li\Desktop\logs\ts_cpuhog_30\feature_hec-01.log');

% raw_data = raw_data(:,2:17);

% mean(raw_data(:,15:16));

normal_pattern = [0.025 0.168 0.018 0.875 0.155 0.825 0.258 0.232 0.242 0.272 0.200 0.180 0.340 0.370 0.230 0.130]';

faulty_pattern = [0.025 0.480 0.018 0.875 0.155 0.825 0.258 0.232 0.242 0.272 0.200 0.180 0.340 0.370 0.230 0.130;
                  0.025 0.168 0.018 0.510 0.155 0.825 0.258 0.232 0.242 0.272 0.200 0.180 0.340 0.370 0.230 0.130;
                  0.025 0.168 0.018 0.875 0.155 0.825 0.858 0.832 0.742 0.772 0.300 0.280 0.360 0.390 0.330 0.180;
                  0.025 0.168 0.018 0.875 0.535 0.325 0.258 0.232 0.242 0.272 0.300 0.280 0.360 0.390 0.330 0.180]';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_noise_var = [ 0.4 0.4 0.4 0.4 0.4 0.4 0.5 0.5 0.5 0.5 0.4 0.4 0.4 0.4 0.4 0.4] - 0.1;

f_noise_var = [ 0.4 0.4 0.4 0.4 0.4 0.4 0.5 0.5 0.5 0.5 0.4 0.4 0.4 0.4 0.4 0.4] - 0.1;

a_noise_var = [ 0.4 0.4 0.4 0.4 0.4 0.4 0.5 0.5 0.5 0.5 0.4 0.4 0.4 0.4 0.4 0.4] + 0.2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


num_f_node = f_nodes;
rand_idx = randperm(num_nodes);
f_node_idx = rand_idx(1:num_f_node);
a_node_idx = rand_idx(num_f_node+1:num_f_node+num_a_node);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data(:,:) = repmat(normal_pattern,1,num_nodes);
    
avg_f = floor(num_f_node/num_f_pattern);
    
for p = 1 : num_f_pattern - 1
    
    data(:,f_node_idx(avg_f*(p-1)+1:avg_f*p)) = repmat(faulty_pattern(:,p),1,avg_f);
    
    label(f_node_idx(avg_f*(p-1)+1:avg_f*p)) = repmat(1+p,1,avg_f);

end
    
r_num = length(f_node_idx) - avg_f*(num_f_pattern-1);
    
data(:,f_node_idx(avg_f*(num_f_pattern-1)+1:length(f_node_idx))) = repmat(faulty_pattern(:,num_f_pattern),1,r_num);
    
label(f_node_idx(avg_f*(num_f_pattern-1)+1:length(f_node_idx))) = repmat(1+num_f_pattern,1,r_num);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
for j = 1 : 16
    
    n_noise = noise_generate ( num_nodes, n_noise_var(j) );
    f_noise = noise_generate ( num_f_node, f_noise_var(j) );
    a_noise = noise_generate ( num_a_node, a_noise_var(j) );
        
    n_data(j,:) = data(j,:) + data(j,:) .* (n_noise / 10);
    n_data(j,f_node_idx) = data(j,f_node_idx) + data(j,f_node_idx) .* (f_noise / 10);
    n_data(j,a_node_idx) = data(j,a_node_idx) + data(j,a_node_idx) .* (a_noise / 10);
        
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[label;n_data]

end