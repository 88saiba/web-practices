#!/usr/bin/env perl
use strict;
use warnings;

# Mendeklarasikan variabel skalar
my $nama = "Budi";  # Sebuah string
my $umur = 30;      # Sebuah angka
my $tinggi = 1.75;  # Sebuah angka desimal

# Menampilkan nilai skalar
print "Nama: $nama\n";       # Output: Nama: Budi
print "Umur: $umur tahun\n"; # Output: Umur: 30 tahun
print "Tinggi: $tinggi m\n"; # Output: Tinggi: 1.75 m

# Menggunakan skalar dalam operasi
my $umur_tambah_lima = $umur + 5;
print "Umur setelah lima tahun: $umur_tambah_lima tahun\n"; # Output: Umur setelah lima tahun: 35 tahun

# Tipe data skalar

# 1. String
my $string = "Halo, Dunia!";
print "String: $string\n";  # Output: String: Halo, Dunia!

# 2. Angka bulat
my $angka_bulat = 42;
print "Angka bulat: $angka_bulat\n";  # Output: Angka bulat: 42

# 3. Angka desimal
my $angka_desimal = 3.14;
print "Angka desimal: $angka_desimal\n";  # Output: Angka desimal: 3.14

# 4. Boolean
my $benar = 1;  # 1 dianggap sebagai true
my $salah = 0;  # 0 dianggap sebagai false
print "Benar: $benar, Salah: $salah\n";  # Output: Benar: 1, Salah: 0

# 5. Nilai tidak terdefinisi
my $tidak_terdefinisi;  # Variabel ini tidak memiliki nilai
print "Nilai tidak terdefinisi: $tidak_terdefinisi\n";  # Output: Nilai tidak terdefinisi: 

# 6. String kosong
my $string_kosong = "";
print "String kosong: '$string_kosong'\n";  # Output: String kosong: ''

# 7. Nilai referensi
my $array_ref = [1, 2, 3];  # Referensi ke array
print "Referensi array: @$array_ref\n";  # Output: Referensi array: 123

# --------------------------------------------------------

# Mendeklarasikan array
my @buah = ("Apel", "Pisang", "Jeruk", "Mangga");

# Mengakses elemen array
print "Buah pertama: $buah[0]\n";  # Output: Buah pertama: Apel
print "Buah kedua: $buah[1]\n";     # Output: Buah kedua: Pisang

# Menambahkan elemen baru ke array
push @buah, "Anggur";  # Menambahkan "Anggur" ke akhir array

# Mengiterasi semua elemen dalam array
foreach my $item (@buah) {
    print "Buah: $item\n";
}

# Menghitung jumlah elemen dalam array
my $jumlah_buah = scalar @buah;
print "Jumlah buah: $jumlah_buah\n";  # Output: Jumlah buah: 5

# Mendeklarasikan array dengan berbagai tipe data

# 1. Array dengan string
my @buah = ("Apel", "Pisang", "Jeruk");
print "Array buah: @buah\n";  # Output: Array buah: Apel Pisang Jeruk

# 2. Array dengan angka bulat
my @angka_bulat = (1, 2, 3, 4, 5);
print "Array angka bulat: @angka_bulat\n";  # Output: Array angka bulat: 1 2 3 4 5

# 3. Array dengan angka desimal
my @angka_desimal = (1.1, 2.2, 3.3);
print "Array angka desimal: @angka_desimal\n";  # Output: Array angka desimal: 1.1 2.2 3.3

# 4. Array campuran
my @campuran = ("Budi", 30, 3.14, "Jakarta");
print "Array campuran: @campuran\n";  # Output: Array campuran: Budi 30 3.14 Jakarta

# 5. Array kosong
my @kosong = ();
print "Array kosong: @kosong\n";  # Output: Array kosong: 

# 6. Array dengan referensi
my @referensi = ([1, 2, 3], [4, 5, 6]);
print "Referensi array pertama: @{$referensi[0]}\n";  # Output: Referensi array pertama: 1 2 3
print "Referensi array kedua: @{$referensi[1]}\n";   # Output: Referensi array kedua: 4 5 6

# 7. Array dengan nilai boolean
my @boolean = (1, 0, 1, 0);
print "Array boolean: @boolean\n";  # Output: Array boolean: 1 0 1 0

# --------------------------------------------------------

# Membuat hash
my %hash = (
    "nama"  => "Andi",
    "umur"  => 25,
    "kota"  => "Jakarta"
);

# Mengakses nilai dari hash
print "Nama: $hash{nama}\n";  # Output: Nama: Andi
print "Umur: $hash{umur}\n";   # Output: Umur: 25
print "Kota: $hash{kota}\n";   # Output: Kota: Jakarta

# Menambahkan elemen baru ke hash
$hash{pekerjaan} = "Programmer";

# Mengiterasi semua elemen dalam hash
while (my ($kunci, $nilai) = each %hash) {
    print "$kunci: $nilai\n";
}

# Mendeklarasikan hash dengan berbagai tipe data

# 1. Hash dengan string
my %data_string = (
    "nama" => "Andi",
    "kota" => "Jakarta"
);
print "Nama: $data_string{nama}, Kota: $data_string{kota}\n";  # Output: Nama: Andi, Kota: Jakarta

# 2. Hash dengan angka bulat
my %data_angka = (
    "umur" => 25,
    "tahun" => 2024
);
print "Umur: $data_angka{umur}, Tahun: $data_angka{tahun}\n";  # Output: Umur: 25, Tahun: 2024

# 3. Hash dengan angka desimal
my %data_desimal = (
    "tinggi" => 1.75,
    "berat" => 68.5
);
print "Tinggi: $data_desimal{tinggi}, Berat: $data_desimal{berat}\n";  # Output: Tinggi: 1.75, Berat: 68.5

# 4. Hash campuran
my %data_campuran = (
    "nama" => "Budi",
    "umur" => 30,
    "tinggi" => 1.80,
    "status" => "single"
);
print "Data campuran: Nama: $data_campuran{nama}, Umur: $data_campuran{umur}, Tinggi: $data_campuran{tinggi}, Status: $data_campuran{status}\n";

# 5. Hash dengan referensi
my %data_referensi = (
    "buah" => ["Apel", "Pisang", "Jeruk"],  # Referensi ke array
    "sayur" => ["Wortel", "Bayam"]
);
print "Buah pertama: $data_referensi{buah}[0]\n";  # Output: Buah pertama: Apel
print "Sayur pertama: $data_referensi{sayur}[0]\n";  # Output: Sayur pertama: Wortel

# 6. Hash dengan nilai boolean
my %data_boolean = (
    "aktif" => 1,
    "verifikasi" => 0
);
print "Aktif: $data_boolean{aktif}, Verifikasi: $data_boolean{verifikasi}\n";  # Output: Aktif: 1, Verifikasi: 0

# 7. Hash kosong
my %data_kosong = ();
print "Hash kosong: ", scalar(keys %data_kosong), " kunci\n";  # Output: Hash kosong: 0 kunci
