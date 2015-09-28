function normdata = normalize_zo( data )

[row col] = size(data);
normdata = zeros(row,col);

for i = 1 : row
    
    onerow = data(i,:);
    
    minv = min(onerow);
    maxv = max(onerow);
    
    normdata(i,:) = (onerow-minv) / (maxv-minv); 
    
end

end
