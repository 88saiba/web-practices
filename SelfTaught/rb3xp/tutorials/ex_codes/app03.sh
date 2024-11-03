if [ ! -f /tmp/.apt_update_done ]; then
    rb -e '
        puts "saiba: welkomme, master gilarb!";
        puts "saiba: checking update first...";
        puts "saiba: C-c to skip it...";

        # Jalankan update dan cek paket yang bisa di-upgrade
        system("sudo apt update")
        upgrade_needed = `apt list --upgradable 2>/dev/null | wc -l`.to_i > 1

        if upgrade_needed
            puts "saiba: Upgrading packages..."
            system("sudo apt upgrade -y")

            # Melakukan update ulang setelah upgrade untuk memastikan semuanya sudah terbaru
            puts "saiba: Re-checking updates..."
            system("sudo apt update")
        else
            puts "saiba: All packages are up to date."
        end

        # Jika tidak ada lagi yang bisa di-upgrade, menulis file sebagai tanda
        File.write("/tmp/.apt_update_done", " ")
        system("sleep 1.2")
        system("clear")
    '
fi

### Penjelasan Tambahan
# 1. **Pengecekan Paket yang Perlu Di-upgrade**: Skrip menjalankan `apt update` dan kemudian mengecek apakah ada paket yang 
# masih bisa di-upgrade dengan `apt list --upgradable`.
# 2. **Upgrade dan Update Ulang**: Jika ada paket yang perlu di-upgrade, skrip akan menjalankan `sudo apt upgrade -y`, lalu
# `sudo apt update` lagi untuk memastikan semuanya terbaru.
# 3. **File `.apt_update_done`**: Hanya akan dibuat jika semua paket sudah diperbarui, sehingga skrip tidak akan berjalan
# lagi di masa mendatang jika sudah up-to-date.

# Mari kita uraikan perintah di bawah ini selangkah demi selangkah:

`apt list --upgradable 2>/dev/null | wc -l`.to_i > 1

### Penjelasan Bagian per Bagian

# 1. Backticks (`...`):
   # - Di Ruby, segala sesuatu di dalam tanda backticks (`...`) akan dieksekusi sebagai perintah shell atau terminal, dan
   # hasilnya akan dikembalikan sebagai string.
   # - Dalam hal ini, kita mengeksekusi perintah shell `apt list --upgradable 2>/dev/null | wc -l`.

# 2. `apt list --upgradable`:
   # - Perintah ini menampilkan daftar paket yang bisa di-upgrade (diperbarui) di sistem.
   # - Outputnya berupa daftar paket, satu per baris, dan jika semuanya sudah versi terbaru, biasanya tidak ada output
   # kecuali pesan "Listing..." di header.

# 3. `2>/dev/null`:
   # - `2>/dev/null` adalah cara untuk mengabaikan error atau peringatan dari perintah.
   # - `2>` artinya kita mengarahkan *output* dari *error stream* (file descriptor 2) ke `/dev/null`, sehingga semua pesan
   # error tidak akan ditampilkan di terminal.
   # - Ini berguna jika ingin menjalankan perintah tanpa melihat error atau pesan warning, misalnya jika tidak ada yang bisa
   # di-upgrade.

# 4. `| wc -l`:
   # - Simbol `|` adalah *pipe*, yang mengirimkan output dari perintah sebelumnya (`apt list --upgradable 2>/dev/null`)
   # ke perintah berikutnya (`wc -l`).
   # - `wc -l` adalah perintah untuk menghitung jumlah baris pada output yang diberikan.
   # - Jadi, `wc -l` akan menghitung berapa banyak baris yang dihasilkan oleh `apt list --upgradable`.

# 5. `.to_i`:
   # - Perintah ini mengubah output string dari perintah ke angka integer.
   # - Misalnya, jika output `wc -l` menghasilkan `3`, maka `.to_i` mengubahnya menjadi angka 3, yang merupakan tipe data
   # integer di Ruby.

# 6. `> 1`:
   # - Ini adalah operator pembanding yang memeriksa apakah hasil konversi integer dari baris di atas lebih besar dari 1.
   # - Di sini, kita ingin tahu apakah jumlah baris output lebih dari 1 (karena ada header satu baris). Jika lebih dari 1,
   # artinya ada paket yang bisa di-upgrade.

### Kesimpulan dari Kode Ini
# Perintah ini akan mengembalikan `true` jika ada paket yang bisa di-upgrade, dan `false` jika semua paket sudah versi terbaru.
