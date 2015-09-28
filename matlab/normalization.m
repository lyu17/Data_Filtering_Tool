function normalized_data = normalization( data, type, label )
 
switch type
 
    case 'nl_cpuhog '
        
        data(data==inf) = 0;
        
        data(isnan(data)) = 0;
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4:16) = data(:,4:16)./100000000;
 
        normalized_data = (sum(n_data(1:12,1:16),1)/size(n_data(1:12,1:16),1));
    
    case 'wc_cpuhog '
        
        data(data==inf) = 0;
        
        data(isnan(data)) = 0;
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4:16) = data(:,4:16)./500000000;
 
        normalized_data = (sum(n_data(1:12,1:16),1)/size(n_data(1:12,1:16),1));    

    case 'ts_cpuhog '
        
        data(data==inf) = 0;
        
        data(isnan(data)) = 0;
 
        n_data(:,1:3) = data(:,1:3)./100;
        
        if label == 1
            n_data(:,2) = min(data(:,2))./100;
        end
 
        n_data(:,[4:8 11:14]) = data(:,[4:8 11:14])./1000000000;
        
        n_data(:,[9 10 15 16]) = data(:,[9 10 15 16])./100000000000;
 
        normalized_data = (sum(n_data(1:12,1:16),1)/size(n_data(1:12,1:16),1)); 
        
    case 'nl_memleak'
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4) = min(data(:,4))./8100000;
        
        if label == 1
            n_data(:,4) = max(data(:,4))./8100000;
        end
 
        n_data(:,5:16) = data(:,5:16)./100000000;
 
        normalized_data = (sum(n_data(1:15,1:16),1)/size(n_data(1:15,1:16),1));
    
    case 'wc_memleak'
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4) = min(data(:,4))./8100000;
        
        if label == 1
            n_data(:,4) = max(data(:,4))./8100000;
        end
 
        n_data(:,5:16) = data(:,5:16)./100000000;
 
        normalized_data = (sum(n_data(1:15,1:16),1)/size(n_data(1:15,1:16),1));    

    case 'ts_memleak'
 
        n_data(:,1:3) = data(:,1:3)./400;
 
        n_data(:,4) = min(data(:,4))./8100000;
        
        if label == 1
            n_data(:,4) = max(data(:,4))./8100000;
        end
 
        n_data(:,[5:8 11:14]) = data(:,[5:8 11:14])./1000000000;
        
        n_data(:,[9 10 15 16]) = data(:,[9 10 15 16])./100000000000;
 
        normalized_data = (sum(n_data(1:15,1:16),1)/size(n_data(1:15,1:16),1)); 
        
    case 'nl_nethog '
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4) = data(:,4)./810000000;
 
        if label == 1
        
            n_data(:,7) = min(data(:,7))./1000000;
 
            n_data(:,8) = min(data(:,8))./1000000;
 
            n_data(:,9) = min(data(:,9))./50000000;
 
            n_data(:,10) = min(data(:,10))./1000000;
        
        else
            
            n_data(:,7) = max(data(:,7))./1000000;
 
            n_data(:,8) = max(data(:,8))./1000000;
 
            n_data(:,9) = max(data(:,9))./50000000;
 
            n_data(:,10) = max(data(:,10))./1000000;
        end
 
        n_data(:,[5 6 11 12 13 14 15 16]) = data(:,[5 6 11 12 13 14 15 16])./100000000;
 
        normalized_data = (sum(n_data(6:12,1:16),1)/size(n_data(6:12,1:16),1));
 
    case 'wc_nethog '
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4) = data(:,4)./810000000;
 
        if label == 1
        
            n_data(:,7) = min(data(:,7))./1000000;
 
            n_data(:,8) = min(data(:,8))./1000000;
 
            n_data(:,9) = min(data(:,9))./50000000;
 
            n_data(:,10) = min(data(:,10))./1000000;
        
        else
            
            n_data(:,7) = max(data(:,7))./1000000;
 
            n_data(:,8) = max(data(:,8))./1000000;
 
            n_data(:,9) = max(data(:,9))./50000000;
 
            n_data(:,10) = max(data(:,10))./1000000;
        end
 
        n_data(:,[5 6 11 12 13 14 15 16]) = data(:,[5 6 11 12 13 14 15 16])./100000000;
 
        normalized_data = (sum(n_data(6:12,1:16),1)/size(n_data(6:12,1:16),1));
        
    case 'ts_nethog '
 
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4) = data(:,4)./810000000;
 
        if label == 1
        
            n_data(:,7) = min(data(:,7))./1000000;
 
            n_data(:,8) = min(data(:,8))./1000000;
 
            n_data(:,9) = min(data(:,9))./50000000;
 
            n_data(:,10) = min(data(:,10))./100000000;
        
        else
            
            n_data(:,7) = max(data(:,7))./1000000;
 
            n_data(:,8) = max(data(:,8))./1000000;
 
            n_data(:,9) = max(data(:,9))./50000000;
 
            n_data(:,10) = max(data(:,10))./10000000;
        end
 
        n_data(:,[5 6 11 12 13 14 15 16]) = data(:,[5 6 11 12 13 14 15 16])./100000000000;
 
        normalized_data = (sum(n_data(6:12,1:16),1)/size(n_data(6:12,1:16),1));

    case 'nl_diskhog'
        
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(2:12,6) = max(data(2:12,6))./80000;
 
        n_data(:,[4 5 7:16]) = data(:,[4 5 7:16])./100000000;
 
        normalized_data = (sum(n_data(2:12,1:16),1)/size(n_data(2:12,1:16),1)); 
    
    case 'wc_diskhog'
        
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(2:12,6) = max(data(2:12,6))./80000;
 
        n_data(:,[4 5 7:16]) = data(:,[4 5 7:16])./100000000;
 
        normalized_data = (sum(n_data(2:12,1:16),1)/size(n_data(2:12,1:16),1));
        
    case 'ts_diskhog'
        
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(2:12,6) = max(data(2:12,6))./80000;
        
        if label == 1
            n_data(2:12,6) = min(data(2:12,6))./80000;
        end
 
        n_data(:,[4 5 7:16]) = data(:,[4 5 7:16])./1000000000000;
 
        normalized_data = (sum(n_data(2:12,1:16),1)/size(n_data(2:12,1:16),1));
        
    otherwise
        
        n_data(:,1:3) = data(:,1:3)./100;
 
        n_data(:,4) = min(data(:,4))./81000000;
        
        n_data(:,5:16) = data(:,5:16)./100000000;
 
        normalized_data = (sum(n_data(1:12,1:16),1)/size(n_data(1:12,1:16),1));
 
end
 
end
