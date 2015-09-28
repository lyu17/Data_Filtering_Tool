function n_data = normdatam( data, type, label )

%%remove%noise%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data(data==inf) = 0;

data(isnan(data)) = 0;

n_data = mean(data);

n_data(5) = 0;

%%noworkload%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch type
    
    case 'nl_cpuhog '
        
        if label == 1
            n_data(2) = min(data(:,2));
        else
            n_data(2) = max(data(:,2));
        end
        
        divisor = [100 100 100 10^8 10^0 10^3 10^6 10^6 10^9 10^9 10^3 10^3 10^3 10^3 10^9 10^9];
        
        n_data = n_data ./ divisor;
 
    case 'wc_cpuhog '
        
        if label == 1
            n_data(2) = min(data(:,2));
        else
            n_data(2) = max(data(:,2));
        end
        
        divisor = [100 100 100 10^8 10^0 10^3 10^6 10^6 10^9 10^9 10^3 10^3 10^3 10^3 10^9 10^9];
        
        n_data = n_data ./ divisor;
    
    case 'ts_cpuhog '
        
        if label == 1
            n_data(2) = min(data(:,2));
        else
            n_data(2) = max(data(:,2));
        end
        
        divisor = [100 100 100 10^8 10^0 10^6 10^6 10^6 10^9 10^9 10^3 10^3 10^3 10^3 10^12 10^12];
        
        n_data = n_data ./ divisor;

    case 'nl_memleak'
        
        if label == 1
            n_data(4) = max(data(:,4));
        else
            n_data(4) = min(data(:,4));
        end
        
        divisor = [100 100 100 10^7 10^0 10^5 10^6 10^6 10^9 10^9 10^3 10^3 10^3 10^3 10^9 10^9];
        
        n_data = n_data ./ divisor;  
        
    case 'wc_memleak'
        
        if label == 1
            n_data(4) = max(data(:,4));
        else
            n_data(4) = min(data(:,4));
        end
        
        divisor = [100 100 100 10^7 10^0 10^3 10^6 10^6 10^9 10^9 10^3 10^3 10^3 10^3 10^9 10^9];
        
        n_data = n_data ./ divisor;  
        
    case 'ts_memleak'
        
        if label == 1
            n_data(4) = max(data(:,4));
        else
            n_data(4) = min(data(:,4));
        end
        
        divisor = [100 100 100 10^7 10^0 10^6 10^6 10^6 10^9 10^9 10^3 10^3 10^3 10^3 10^12 10^12];
        
        n_data = n_data ./ divisor;  

    case 'wc_nethog '
        
        if label == 1
            n_data(9:10) = min(data(:,9:10));
        else
            n_data(9:10) = max(data(:,9:10));
        end
        
        divisor = [100 100 100 10^8 10^0 10^3 10^6 10^6 10^7 10^7 10^3 10^3 10^3 10^3 10^9 10^9];
        
        n_data = n_data ./ divisor;          
        
    otherwise
        
        n_data = data;
 
end
 
end
