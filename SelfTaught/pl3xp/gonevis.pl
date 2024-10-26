#!/usr/bin/perl
use strict;
use warnings;

# Name: Goenv Automate Installation Script (Goenvis)
# Author: Gillar Ajie Prasatya (88saiba)
# Deskripsi: Skrip ini mengotomatisasi proses instalasi beberapa plugin untuk env di Golang 
# menggunakan ASDF, dengan melakukan pengecekan untuk memastikan bahwa setiap plugin telah diinstal
# dan diatur sebagai global sebelum melanjutkan ke plugin berikutnya.
# skrip ini bisa anda modifikasi sesuai keinginan plugin apa yg ingin anda install menggunakan ASDF


# Daftar plugin dan URL
my @plugins = (
    { name => "golang", url => "https://github.com/asdf-community/asdf-golang.git" },
    { name => "gofumpt", url => "https://github.com/looztra/asdf-gofumpt.git" },
    { name => "golangci-lint", url => "https://github.com/hypnoglow/asdf-golangci-lint.git" },
    { name => "goconvey", url => "https://github.com/therounds-contrib/asdf-goconvey.git" },
);

# Fungsi untuk menjalankan perintah shell
sub run_command {
    my $command = shift;
    print "Running: $command\n";
    my $output = `$command`;
    if ($? != 0) {
        die "Command failed: $command\nOutput: $output\n";
    }
    print "$output\n";
}

# Fungsi untuk memeriksa apakah plugin sudah terinstal
sub is_installed {
    my $name = shift;
    my $current = `asdf current $name`;
    return $current =~ /\S+/;  # Kembalikan true jika ada output
}

# Instalasi plugin satu per satu dengan pengecekan
foreach my $plugin (@plugins) {
    my $name = $plugin->{name};
    my $url = $plugin->{url};

    # Tambah plugin jika belum ada
    run_command("asdf plugin add $name $url") unless is_installed($name);

    # Install plugin jika belum terinstal
    unless (is_installed($name)) {
        run_command("asdf install $name latest");
    }

    # Set plugin sebagai global jika belum di-set
    my $global = `asdf global $name latest`;
}

print "Installation complete.\n";
