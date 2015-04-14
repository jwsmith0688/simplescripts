#!/usr/bin/perl

use ListFiles;
use Getopt::Long;

my $dir;
my $verbose;

GetOptions(

	'dir=s' 	=> \$dir,
	'verbose=i'	=> \$verbose,

);

my $obj  = ListFiles->new(dir => $dir, verbose => $verbose);

my $ww_files = $obj->ww_files;

for my $ww_file (@{$ww_files}) {

	print "$ww_file\n";
	$obj->remove_ww_perms($ww_file);

}

