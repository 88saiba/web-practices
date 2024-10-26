#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my @numbers = (1,2,3,4,5);
# ini saya coba print foreach pake say, biar gak input \n
# kalo pake print, kita harus input \n manual di valuenya
foreach my $count(@numbers){
	say $count;
}
say "-----------------------------";
# kalo misal kita pake say, terus kita include \n juga kembali, dia akan cetak newline 2x
# untuk $count diharuskna mendeklarasikan menggunakan my karna $count yang sekarang
# dengan $count yang sebelumnya beradi di scoupe berbeda (di dalam foreach berbeda),
# dan akan menjadi variabel skalar yg berbeda pula (bukan 1 variabel sama)
my @numbers_2 = (1,2,3,4,5);
foreach my $count(@numbers_2){
	say $count;
}
say "-----------------------------";
# ini akan menyebabkan warning saja tanpa error/terminate program
# $count masih 1 variabel, tidak menjadi variable berbeda
my $count = 12;
my $count = 13;
