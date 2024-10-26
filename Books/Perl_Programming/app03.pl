#!/usr/bin/env perl
use strict;
use warnings;

# while-loop
=pod
	perl akan membaca input perbaris > save ke variabel > memprosesnya
	kemudian mengambil kembali baris selanjutnya, dan mengulang proses
	yang sama hingga baris akhir. 
=cut

my $i = 0;

while ($i < 10){
	print "skalar $i\n";
	$i++; #postfix-increment
}

# kita coba di array, cara penggunaannya beda, ini tertulis di buku

my @numbers = (1,2,3,4,5,6,7,8,9);

while (my $count =  shift @numbers){
	print "array $count\n";
}
