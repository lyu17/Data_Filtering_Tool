function [ GG GF FG FF rand ] = detection( data, nb_num, group_type, method, theta, label, pca_dim, kernel, kerneloption )

node_num = size(data,2);

rand = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if group_type == 'b'
    neighbor = group_b( node_num, nb_num );
elseif group_type == 'c'
    neighbor = group_c( node_num, nb_num );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if strcmp(method,'deviation') == 1
    [ GG GF FG FF ] = deviation( data, neighbor, theta, label, pca_dim, kernel, kerneloption );
elseif strcmp(method,'deviation1') == 1
    [ GG GF FG FF ] = deviation1( data, neighbor, theta, label, pca_dim, kernel, kerneloption );
elseif strcmp(method,'vote') == 1
    [ GG GF FG FF rand ] = vote( data, neighbor, theta, label, pca_dim, kernel, kerneloption );
elseif strcmp(method,'vote_k2') == 1
    [ GG GF FG FF rand ] = vote_k2( data, neighbor, theta, label, pca_dim, kernel, kerneloption );
elseif strcmp(method,'vote_pca') == 1
    [ GG GF FG FF rand ] = vote_pca( data, neighbor, theta, label, pca_dim, kernel, kerneloption );
elseif strcmp(method,'vote_nf') == 1
    [ GG GF FG FF rand ] = vote_nf( data, neighbor, theta, label, pca_dim, kernel, kerneloption );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end