function n_data = normdata( data, type, label )

%%remove%noise%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data(data==inf) = 0;

data(isnan(data)) = 0;

n_data = zeros(1,16);

range = 3:12;

len = length(range);

%%noworkload%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch type
 
    case 'nl_cpuhog '
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        n_data(4:16) = sum(data(range,4:16),1)/(100000000*len);
        
    case 'nl_memleak'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        if label == 1
            n_data(4) = max(data(:,4))/(30000000);
        else
            n_data(4) = min(data(:,4))/(30000000);
        end
        
        n_data(5:16) = sum(data(range,5:16),1)/(100000000*len);
        
     case 'nl_nethog '
         
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        n_data(4:8) = sum(data(range,4:8),1)/(100000000*len);
        
        if label == 1
            n_data(9) = min(data(:,9))/(10000000);
            n_data(10) = min(data(:,10))/(1000000);
        else
            n_data(9) = max(data(:,9))/(10000000);
            n_data(10) = max(data(:,10))/(1000000);
        end
        
    case 'nl_diskhog'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
 
        n_data(6) = max(data(2:12,6))./80000;
 
        n_data(4:5) = sum(data(range,4:5),1)/(100000000*len);
        n_data(7:16) = sum(data(range,7:16),1)/(100000000*len);
        
    case 'nl_cpumem '
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        if label == 1
            n_data(4) = max(data(:,4))/(30000000);
        else
            n_data(4) = min(data(:,4))/(30000000);
        end
        
        n_data(5:16) = sum(data(range,5:16),1)/(100000000*len);
    
    case 'nl_netdisk'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        n_data(4:5) = sum(data(range,4:5),1)/(100000000*len);
        
        n_data(6) = max(data(2:12,6))./80000;
        
        n_data(7:8) = sum(data(range,7:8),1)/(100000000*len);
        
        if label == 1
            n_data(9) = min(data(:,9))/(10000000);
            n_data(10) = min(data(:,10))/(1000000);
        else
            n_data(9) = max(data(:,9))/(10000000);
            n_data(10) = max(data(:,10))/(1000000);
        end
        
    case 'wc_cpuhog '
        
        if label == 1
            n_data(2) = min(data(:,2))/(100);
        else
            n_data(2) = max(data(:,2))/(100);
        end
        
        n_data(1) = sum(data(range,1),1)/(100*len);
        n_data(3) = sum(data(range,3),1)/(100*len);
        
        n_data(4:16) = sum(data(range,4:16),1)/(10000000000*len);  

%       n_data(2) = sum(data(range,2),1)/(100*len);
%       n_data(4:16) = sum(data(range,4:16),1)/(50000000*len);
    
    case 'wc_memleak'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        if label == 1
            n_data(4) = max(data(:,4))/(30000000);
        else
            n_data(4) = min(data(:,4))/(30000000);
        end
        
        n_data(5:16) = sum(data(range,5:16),1)/(100000000*len);

     case 'wc_nethog '
         
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        n_data(4:8) = sum(data(range,4:8),1)/(100000000*len);
        
        if label == 1
            n_data(9) = min(data(:,9))/(10000000);
            n_data(10) = min(data(:,10))/(1000000);
        else
            n_data(9) = max(data(:,9))/(10000000);
            n_data(10) = max(data(:,10))/(1000000);
        end
        
        n_data(11:16) = sum(data(range,11:16),1)/(100000000*len);
        
    case 'wc_diskhog'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
 
        n_data(6) = max(data(2:12,6))./80000;
 
        n_data(4:5) = sum(data(range,4:5),1)/(100000000*len);
        n_data(7:16) = sum(data(range,7:16),1)/(100000000*len);
   
    case 'wc_cpumem '
     
        n_data(1) = sum(data(range,1),1)/(100*len);
        n_data(3) = sum(data(range,3),1)/(100*len);
        
        if label == 1
            n_data(2) = min(data(:,2))/(100);
            n_data(4) = max(data(:,4))/(30000000);
%           n_data(4) = max(data(:,4))/(50000000);
        else
            n_data(2) = max(data(:,2))/(100);
            n_data(4) = min(data(:,4))/(30000000);
%           n_data(4) = min(data(:,4))/(50000000);
        end
        
        n_data(5:16) = sum(data(range,5:16),1)/(100000000*len);
        
%        n_data(2) = sum(data(range,2),1)/(100*len);
%        n_data(5:16) = sum(data(range,5:16),1)/(50000000*len);
        
    case 'wc_netdisk'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        n_data(4:5) = sum(data(range,4:5),1)/(100000000*len);
        
        n_data(6) = max(data(2:12,6))./80000;
        
        n_data(7:8) = sum(data(range,7:8),1)/(100000000*len);
        
        if label == 1
            n_data(9) = min(data(:,9))/(10000000);
            n_data(10) = min(data(:,10))/(1000000);
        else
            n_data(9) = max(data(:,9))/(10000000);
            n_data(10) = max(data(:,10))/(1000000);
        end
        
        n_data(11:16) = sum(data(range,11:16),1)/(100000000*len);
        
    case 'ts_cpuhog '
        
        if label == 1
            n_data(2) = min(data(:,2))/(100);
        else
            n_data(2) = max(data(:,2))/(100);
        end
        
        n_data(1) = sum(data(range,1),1)/(100*len);
        n_data(3) = sum(data(range,3),1)/(100*len);
        
        n_data(4:16) = sum(data(range,4:16),1)/(10000000000*len); 
    
    case 'ts_memleak'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        if label == 1
            n_data(4) = max(data(:,4))/(30000000);
        else
            n_data(4) = min(data(:,4))/(30000000);
        end
        
        n_data(5:16) = sum(data(range,5:16),1)/(100000000000*len);
     
    case 'ts_nethog '
         
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        n_data(4:8) = sum(data(range,4:8),1)/(100000000*len);
        
        if label == 1
            n_data(9) = min(data(:,9))/(10000000000);
            n_data(10) = min(data(:,10))/(1000000000);
        else
            n_data(9) = max(data(:,9))/(10000000000);
            n_data(10) = max(data(:,10))/(1000000000);
        end
        
        n_data(11:16) = sum(data(range,11:16),1)/(100000000000*len);        
    
    case 'ts_diskhog'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
 
        if label == 1
            n_data(6) = min(data(:,6))./80000;
        else
            n_data(6) = max(data(:,6))./80000;
        end
 
        n_data(4:5) = sum(data(range,4:5),1)/(100000000*len);
        n_data(7:16) = sum(data(range,7:16),1)/(100000000000*len);  
        
    case 'ts_cpumem '
        
        n_data(1) = sum(data(range,1),1)/(100*len);
        n_data(3) = sum(data(range,3),1)/(100*len);
        
        if label == 1
            n_data(2) = min(data(:,2))/(100);
            n_data(4) = max(data(:,4))/(30000000);
        else
            n_data(2) = max(data(:,2))/(100);
            n_data(4) = min(data(:,4))/(30000000);
        end
        
        n_data(5:16) = sum(data(range,5:16),1)/(100000000000*len);
        
    case 'ts_netdisk'
        
        n_data(1:3) = sum(data(range,1:3),1)/(100*len);
        
        n_data(4:5) = sum(data(range,4:5),1)/(100000000*len);
        
        n_data(7:8) = sum(data(range,7:8),1)/(100000000*len);
        
        if label == 1
            n_data(6) = min(data(:,6))./80000;
            n_data(9) = min(data(:,9))/(10000000000);
            n_data(10) = min(data(:,10))/(10000000000);
        else
            n_data(6) = max(data(2:12,6))./80000;
            n_data(9) = max(data(:,9))/(10000000000);
            n_data(10) = max(data(:,10))/(10000000000);
        end
        
        n_data(11:16) = sum(data(range,11:16),1)/(100000000000*len);
        
    otherwise
        
        n_data = data;
 
end
 
end
