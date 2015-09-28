function [ D T ] = dev_test1( X, Y, theta_d )

col = size(Y,2);
AVG = sum(Y,2)./col;

D = sqrt(sum((X-AVG).^2));

ad = avg_distance( [X Y], col );

dev = (D-ad) / ad;

T = 0;

if dev > theta_d
    T = 1;
end

end