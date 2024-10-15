#!/usr/bin/env perl

use strict;
use warnings;

my $bandung = "kota";
my $jakarta = "ibukota";  
my $surabaya = "pelabuhan"; 

my @ref = (\$bandung, \$jakarta, \$surabaya);  # Array referensi ke beberapa variabel

# Mengubah semua referensi menjadi "desa"
foreach my $i (@ref) {
    $$i = "desa";  # Dereferensiasi dan ubah nilainya
}

# Cetak semua variabel setelah perubahan
print "$bandung, $jakarta, $surabaya\n";  # Akan mencetak "desa, desa, desa"
