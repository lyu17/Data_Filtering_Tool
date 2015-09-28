function datapca = data_pca( data, num_c )

coff = princomp ( data' );

datapca = data' * coff ( :, 1:num_c );

datapca = datapca';

end