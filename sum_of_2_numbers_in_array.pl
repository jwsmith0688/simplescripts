#!/usr/bin/perl

use strict;
use warnings;

my $aref1 = [18, 11, 21, 28, 31, 38, 40, 55, 60, 62];

## find out if any of these two numbers = 66

my $retval = sum($aref1);
print "$retval\n";

sub sum { 

	my $aref1 = shift;

	for my $val1 (@{$aref1}) {

		for my $val2 (@{$aref1}) {

			my $sum = $val1 + $val2;
			if ($sum == 66) {

				return 1;				

			}

		}

	}

}
