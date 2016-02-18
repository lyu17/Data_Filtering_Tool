%function vecN = normalization( vec )

%tol = 1e-15;

%vec = vec';

%normA = max(vec) - min(vec) + tol;

%normA = repmat(normA, [size(vec,1) 1]);

%minA = repmat(min(vec), [size(vec,1) 1]);

%vecN = ((vec-minA)./normA)';

%end

%function normalize

clear;
clc;

node_list = 1:63;
node_list(node_list==5) = [];

modenum = [];
meannum = [];
maxinum = [];
mininum = [];
varnum = [];

for i = 1 : 62
    
    if node_list(i) < 10
        file_name = strcat('C:\Users\Yu\Desktop\wc_nethog\wc_nethog_05\feature_hec-0',num2str(node_list(i)),'.log');
    else
        file_name = strcat('C:\Users\Yu\Desktop\wc_nethog\wc_nethog_05\feature_hec-',num2str(node_list(i)),'.log');
    end
    
    raw_data = importdata(file_name);
    
    col = size(raw_data,2);
    
    node_data = raw_data(6:15,2:col);
    
    modenum = [modenum;mode(node_data)];
    
    meannum = [meannum;mean(node_data)];
    
    maxinum = [maxinum;max(node_data)];
    
    mininum = [mininum;min(node_data)];
    
    varnum = [varnum;var(node_data)];
    
end




%vecN = vec;

%vecN(1:3,:) = vecN(1:3,:)./100;

%vecN(4,:) = vecN(4,:)./8100000;

%end