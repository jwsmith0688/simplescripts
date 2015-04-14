 my @range = ([2,4], [3, 4]); ‪#‎input‬ sets

my $min = min map {$_->[0]} @range;
my $max = max map {$_->[1]} @range;

my @vec = ("") x @range;

for my $i (0 .. @vec) {
vec($vec[$i], $_, 1) = 1 for $range[$i][0] .. $range[$i][1];
}

my $overlap = shift @vec;
$overlap &= $vec[ $_ ] for 0 .. $@vec;

my $count;
for my $offset ($min .. $max) {
++$count if vec($overlap, $offset, 1) == 1;
}

print $count;
