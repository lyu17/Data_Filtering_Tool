clearvars -except data

ovisdata = textread('ovis.txt');

col = size(ovisdata,2);
Y = ovisdata(:,col);
miu_Y = mean(Y);
R = ones(1,col-1);

for i = 1 : col-1
    
    X = ovisdata(:,i);
    
    if var(X) ~= 0
        
        miu_X = mean(X);
        
        cov_XY = sum((X-miu_X).*(Y-miu_Y));
        
        var_X = sum((X-miu_X).^2);
        
        var_Y = sum((Y-miu_Y).^2);
        
        R(i) = cov_XY^2 / var_X * var_Y;
    
    else
        
        R(i) = -1;
    
    end
    
end

[value,index] = sort(R,'descend');

filename = strcat('cov_rank.txt')

fid = fopen(filename, 'w');
for i = 1 : 613
    fprintf(fid,'%d ',index(i));
end
fclose(fid);

