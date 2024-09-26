# Q1: Di ruby method .capitalize! sama .upcase! bedanya apaan?
# terus kenapa dikasi simbol ! di akhir nama methodnya?

### Perbedaan `.capitalize!` dan `.upcase!`:

# 1. **`.capitalize!`**:
   # - Mengubah huruf pertama dari string menjadi huruf kapital dan mengubah semua huruf lain menjadi huruf kecil.
   # - Contoh:
     name = "john"
     name.capitalize!  # Output: "John"
     
# 2. **`.upcase!`**:
   # - Mengubah semua huruf dalam string menjadi huruf kapital (uppercase).
   # - Contoh:
     state = "california"
     state.upcase!  # Output: "CALIFORNIA"

### Makna Simbol `!` di Akhir Nama Method:
# Simbol `!` pada metode Ruby menunjukkan bahwa metode tersebut **mengubah objek secara langsung** (mutates the object) alih-alih mengembalikan nilai baru tanpa mengubah objek aslinya. Jika kamu memanggil metode tanpa `!`, objek asli tidak akan diubah, dan perubahan hanya akan terjadi pada nilai yang dikembalikan.

# - **Dengan `!`**:

  name = "john"
  name.capitalize!  # Mengubah langsung variabel 'name' menjadi "John"

# - **Tanpa `!`**:
  name = "john"
  capitalized_name = name.capitalize  # 'name' tetap "john", hanya 'capitalized_name' yang berubah

### Contoh Kamu:
first_name.capitalize!  # Mengubah huruf pertama nama depan menjadi kapital
last_name.capitalize!   # Mengubah huruf pertama nama belakang menjadi kapital
city.capitalize!        # Mengubah huruf pertama kota menjadi kapital
state.upcase!        # Mengubah seluruh huruf provinsi atau negara bagian menjadi kapital

# Dengan metode ini, variabel `first_name`, `last_name`, `city`, dan `state` langsung diubah isinya, sehingga ketika dicetak menggunakan `puts`, hasilnya sudah sesuai dengan format yang diinginkan.
