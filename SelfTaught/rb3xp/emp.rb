require 'io/console'

	    # 1. Fungsi `main()` adalah loop utama: `main()` berisi loop `while True`, sehingga program terus berjalan
	    # dan menampilkan menu utama sampai Kita memilih opsi `0` untuk keluar.
    
  	  # 2. Setiap Fungsi di Dalam Program Hanya Dieksekusi Sekali Per Pemanggilan:
      # Saat Kita memilih opsi di menu utama (`main()`), misalnya `3` untuk `sites_enable_enginx()`, maka:
      # - Program memanggil fungsi `sites_enable_enginx()` dan menjalankan instruksi-instruksinya dari atas ke bawah sekali
      # saja.
      # - Setelah selesai, fungsi tersebut berakhir, dan kontrol program kembali ke `main()`, yang menampilkan menu lagi.
    
 	   # 3. Input `sub_choice` pada `sites_enable_enginx()`:
     # `sub_choice` hanya berfungsi untuk memeriksa apakah pengguna ingin kembali ke menu utama (`'q'`). Jika input bukan `
     # 'q'`, program menampilkan pesan error, hingga Kita memasukan key yg diminta untuk menyudahi fungsi dan kembali ke
     # main().

def run_command(command)
	system(command)
end

def start_services
  run_command("clear")
  puts "Starting Nginx and MySQL..."
  puts "--------------------------------->"
  run_command("sudo systemctl enable nginx mysql.service")
  run_command("sudo systemctl start nginx mysql.service")
  puts "---------------------------------"
  run_command("sudo systemctl status nginx")
  puts "---------------------------------"
  run_command("sudo systemctl status mysql.service")
end

def stop_services
  run_command("clear")
  puts "Stopping Nginx and MySQL..."
  puts "--------------------------------->"
  run_command("sudo systemctl stop nginx mysql.service")
  run_command("sudo systemctl disable nginx mysql.service")
  puts "---------------------------------"
  run_command("sudo systemctl status nginx")
  puts "---------------------------------"
  run_command("sudo systemctl status mysql.service")
end

def sites_enable_enginx
  run_command("clear")
  puts "Checking Sites-Enable Config..."
  puts "---------------------------------"
  sleep 0.5
  run_command("ls -all /etc/nginx/sites-enabled")
  sleep 0.5
  puts "\nChecking Preps..."
  puts "---------------------------------"
  run_command("sudo nginx -t")
  puts "---------------------------------"
  puts " "
  loop do
    print "\033[F Press 'q' to go back to menu: "
    sub_choice = gets.chomp  # Menggunakan gets.chomp untuk membaca input dan mengabaikan Enter

    if sub_choice == 'q'
      break
    else
      puts "\033[F Invalid, Please Try Again...."
      sleep 0.7
    end
  end
end

def check_services
  run_command("clear")
  puts "Checking Nginx and MySQL..."
  sleep 1.7
  puts "---------------------------------"
  # saya tidak tahu kenapa, tapi di rb, revoke nginx status harus lengkap jadi nginx.service
  # jika tidak, fungsi ini failed 
  run_command("sudo systemctl status nginx.service")
  sleep 0.8
  puts "---------------------------------"
  run_command("sudo systemctl status mysql.service")
end

def monitor_nginx
  run_command("clear")
  puts "Monitoring Nginx..."
  sleep 1
  run_command("sudo multitail /var/log/nginx/access.log /var/log/nginx/error.log")
end

def main
  loop do
    system("clear")
    puts "+===========+"
    puts "Nginx, Mysql Panel"
    puts "-------------"
    puts "EMP-Menu"
    puts "+===========+"
    puts "1. Turn On Engine"
    puts "2. Turn Off Engine"
    puts "3. Check Preps"
    puts "4. Check Engine"
    puts "5. View Logs"
    puts "0. Bail Out"
    puts "-------------"
    puts "Always press 'q' to back menu"
    puts "+===========+"

    print "Choose an option (1/2/3/4/5/0): "
    choice = gets.chomp

    case choice
    when '1'
      start_services
    when '2'
      stop_services
    when '3'
      sites_enable_enginx
    when '4'
      check_services
    when '5'
      monitor_nginx
    when '0'
      puts "Exiting the program."
      sleep 0.4
      run_command("clear")
      break
    else
      puts "Invalid choice. Please try again."
      sleep 0.4
    end
  end
end

main if __FILE__ == $0
