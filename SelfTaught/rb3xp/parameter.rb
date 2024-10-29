### Apa Itu Parameter?

# Parameter adalah *placeholder* di dalam definisi fungsi yang memungkinkan fungsi untuk menerima masukan ketika dipanggil.
# Parameter ini tidak memiliki nilai tetap sampai fungsi benar-benar dipanggil, dan pada saat itulah kita memberikan nilai
# nyata (disebut "argumen") yang diisikan ke dalam parameter.

# Contoh sederhana fungsi dengan parameter:


def greet(name)  # 'name' adalah parameter
  puts "Hello, #{name}"
end


# Di sini, `name` adalah parameter. Ketika kita memanggil fungsi ini dan memasukkan sebuah nilai, misalnya `"Alice"`, nilai
# ini akan menggantikan `name` di dalam fungsi:

greet("Alice")  # Memanggil fungsi dan memasukkan "Alice" sebagai argumen

# Saat ini dijalankan, fungsi `greet` akan mencetak `Hello, Alice`.

### Mengapa `command` Tidak Ditulis Sebagai `"command"`?

# Ketika kita mendefinisikan `command` sebagai parameter di fungsi `run_command`:

def run_command(command)
  system(command)
end

# `command` adalah **nama dari parameter**, bukan nilainya. Menuliskannya sebagai `"command"` malah akan membuat kode
# tersebut salah. Jika kita menulis `"command"`, Ruby akan menganggapnya sebagai *string* literal `"command"`, dan bukan
# sebagai parameter yang bisa diisi dengan nilai saat fungsi dipanggil.

# Contoh kesalahan:

def run_command("command")  # Ini tidak benar
  system("command")  # Ini juga salah karena selalu mengirimkan teks "command"
end

# Dalam kasus ini, fungsi `run_command` akan selalu menerima `"command"` sebagai *string*, bukan sebagai masukan dinamis
# yang bisa berubah tergantung pada nilai yang dimasukkan saat pemanggilan fungsi.

### Apa Saja yang Bisa Ditulis sebagai Parameter?

# Di dalam parameter, Anda bisa menulis:

# 1. **Nama yang Deskriptif**: Nama parameter bisa apa saja yang sesuai dengan konteks, seperti `name`, `command`, `number`,
# `file_name`, dll.
# 2. **Tipe Data yang Diterima**: Tipe data parameter akan bergantung pada apa yang dimasukkan saat pemanggilan. Ruby tidak
# memiliki tipe data tetap untuk parameter, jadi bisa berupa *string*, *number*, *array*, dan lainnya tergantung nilai yang
# diberikan saat pemanggilan.
# 3. **Banyak Parameter**: Anda juga bisa memiliki beberapa parameter, dipisahkan dengan koma:

def example(param1, param2, param3)
	# Kode di sini
end

# Contoh pemanggilan fungsi dengan banyak parameter:

example("Hello", 123, [1, 2, 3])  # Memasukkan string, number, dan array sebagai argumen

#  Parameter adalah **penanda sementara** yang akan diisi dengan nilai nyata saat fungsi dipanggil.
