# Di Ruby, saat kita menggunakan `puts` dengan beberapa argumen yang dipisah oleh koma,
# Ruby akan mencetak setiap argumen pada baris terpisah secara otomatis. Berikut cara kerjanya:

puts "What is 3 + 2?", 3 + 2, "yes"

# Penjelasan kode:
# - `puts` menerima beberapa argumen di sini: `"What is 3 + 2?"`, `3 + 2` (hasilnya `5`), dan `"yes"`,
# - `puts` akan mencetak setiap argumen pada baris terpisah, bukan dalam satu baris, karena `puts`
# menambahkan karakter `\n` (newline) setelah setiap argumen yg ditandai dengan tanda koma,

# Dengan kata lain, `puts` mereset posisi kursor ke awal baris berikutnya setelah mencetak tiap argumen.
