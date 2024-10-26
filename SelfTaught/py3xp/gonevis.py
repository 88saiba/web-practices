#!/usr/bin/env python3
import subprocess

# Name: Goenv Automate Installation Script (Goenvis)
# Author: Gillar Ajie Prasatya (88saiba)
# Deskripsi: Skrip ini mengotomatisasi proses instalasi beberapa plugin untuk env di Golang 
# menggunakan ASDF, dengan melakukan pengecekan untuk memastikan bahwa setiap plugin telah diinstal
# dan diatur sebagai global sebelum melanjutkan ke plugin berikutnya.
# skrip ini bisa anda modifikasi sesuai keinginan plugin apa yg ingin anda install menggunakan ASDF

plugins = [
    {"name": "golang", "url": "https://github.com/asdf-community/asdf-golang.git"},
    {"name": "gofumpt", "url": "https://github.com/looztra/asdf-gofumpt.git"},
    {"name": "golangci-lint", "url": "https://github.com/hypnoglow/asdf-golangci-lint.git"},
    {"name": "goconvey", "url": "https://github.com/therounds-contrib/asdf-goconvey.git"},
]

# Fungsi untuk menjalankan perintah shell
def run_command(command):
    print(f"Running: {command}")
    output = subprocess.run(command, shell=True, capture_output=True, text=True)
    if output.returncode != 0:
        raise Exception(f"Command failed: {command}\nOutput: {output.stderr.strip()}")
    print(output.stdout)

# Fungsi untuk memeriksa apakah plugin sudah terinstal
def is_installed(name):
    current = subprocess.run(f"asdf current {name}", shell=True, capture_output=True, text=True)
    return bool(current.stdout.strip())  # Kembalikan true jika ada output

# Instalasi plugin satu per satu dengan pengecekan
for plugin in plugins:
    name = plugin["name"]
    url = plugin["url"]

    # Tambah plugin jika belum ada
    if not is_installed(name):
        run_command(f"asdf plugin add {name} {url}")

    # Install plugin jika belum terinstal
    if not is_installed(name):
        run_command(f"asdf install {name} latest")

    # Set plugin sebagai global jika belum di-set
    run_command(f"asdf global {name} latest")

print("Installation complete.")
