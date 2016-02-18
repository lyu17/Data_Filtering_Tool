function [ D T ] = sim_test( X, Y, theta_s )

D = sqrt(sum((X-Y).^2));

T = 0;

if D > theta_s
    T = 1;
end

end