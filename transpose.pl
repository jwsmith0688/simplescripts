#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my $matrix = 	[
			
				[1, 2, 3],
				[4, 5, 6],
				[7, 8, 9],

			];

my $transposed = transpose_matrix($matrix);

sub transpose_matrix {

	my $ref = shift;
	my $transposed;

	for my $iter (0 .. 2) {

		for my $loop (0 .. 2) {

			$transposed->[$iter]->[$loop] = $ref->[$loop]->[$iter];

		}					
	
	}

	return $transposed;	

}

print Dumper $transposed;


