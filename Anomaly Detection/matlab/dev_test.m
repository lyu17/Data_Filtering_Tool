function [ D T ] = dev_test( X, Y, theta_d )

col = size(Y,2);
AVG = sum(Y,2)./col;

D = sqrt(sum((X-AVG).^2));

T = 0;

if D > theta_d
    T = 1;
end

end