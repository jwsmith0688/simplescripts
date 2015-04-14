#!/usr/bin/perl 

use strict;
use warnings;
use Data::Dumper;


my $str1 = "cat cat rat dog";
my $str2 = "dog cat at at dog";

my @array = get_samewords($str1, $str2);

for my $word (@array) {

	print "Word that appears in both strings: $word\n";

}

sub get_samewords {

	my($fstr1, $fstr2) = @_;

	my @arr = split(" ", $fstr1);
	my @arr2 = split(" ", $fstr2);

	my %hash;

	for my $first (@arr) { 
	
		for my $second (@arr2) {

			if ($second eq $first) {
	
				$hash{$second} = 1;
			
			}

		}

	}

	return keys(%hash);

}

