#!/usr/bin/env ruby

# Name: Goenv Automate Installation Script (Goenvis)
# Author: Gillar Ajie Prasatya (88saiba)
# Deskripsi: Skrip ini mengotomatisasi proses instalasi beberapa plugin untuk env di Golang 
# menggunakan ASDF, dengan melakukan pengecekan untuk memastikan bahwa setiap plugin telah diinstal
# dan diatur sebagai global sebelum melanjutkan ke plugin berikutnya.
# skrip ini bisa anda modifikasi sesuai keinginan plugin apa yg ingin anda install menggunakan ASDF 

plugins = [
  { name: "golang", url: "https://github.com/asdf-community/asdf-golang.git" },
  { name: "gofumpt", url: "https://github.com/looztra/asdf-gofumpt.git" },
  { name: "golangci-lint", url: "https://github.com/hypnoglow/asdf-golangci-lint.git" },
  { name: "goconvey", url: "https://github.com/therounds-contrib/asdf-goconvey.git" },
]

# Fungsi untuk menjalankan perintah shell
def run_command(command)
  puts "Running: #{command}"
  output = `#{command}`
  raise "Command failed: #{command}\nOutput: #{output}" unless $?.success?
  puts output
end

# Fungsi untuk memeriksa apakah plugin sudah terinstal
def installed?(name)
  output = `asdf current #{name}`
  !output.strip.empty? # Kembalikan true jika ada output
end

# Instalasi plugin satu per satu dengan pengecekan
plugins.each do |plugin|
  name = plugin[:name]
  url = plugin[:url]

  # Tambah plugin jika belum ada
  run_command("asdf plugin add #{name} #{url}") unless installed?(name)

  # Install plugin jika belum terinstal
  unless installed?(name)
    run_command("asdf install #{name} latest")
  end

  # Set plugin sebagai global jika belum di-set
  run_command("asdf global #{name} latest")
end

puts "Installation complete."
