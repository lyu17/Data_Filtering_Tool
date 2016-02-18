function noise = noise_generate ( length, variance )

randsq = rand ( 1, length );

m = mean ( randsq );

v = var ( randsq );

noise = ( randsq - m ) * sqrt( 1 / v * variance );