import random
import os
import platform
import time

# Function to clear the terminal screen
def clear_screen():
    system = platform.system()
    if system == "Windows":
        os.system('cls')
    else:
        os.system('clear')

# Function to display the multiplication table from 2-9 in two columns
def display_multiplication_table():
    print("Multiplication Table 2 - 9\n")
    # Loop untuk menampilkan tabel perkalian dalam dua kolom
    for i in range(1, 10):  # Baris 1-9 untuk setiap tabel
        col1 = [f"{j} x {i} = {j * i}" for j in range(2, 6)]  # Tabel 2 hingga 5
        col2 = [f"{j} x {i} = {j * i}" for j in range(6, 10)]  # Tabel 6 hingga 9
        
        # Gabungkan col1 dan col2 dalam satu baris dengan lebar tetap
        col1_row = "   ".join(f"{item:<10}" for item in col1)
        col2_row = "   ".join(f"{item:<10}" for item in col2)
        print(f"{col1_row}   {col2_row}")
    print()  # Baris kosong setelah tabel

# Function to display the scoreboard
def display_scoreboard(score, mistakes):
    print("\nScoreboard:")
    print(f"Correct : {score}")
    print(f"Incorrect : {mistakes}\n")

# Function to start the multiplication quiz game
def multiplication_quiz():
    # Menampilkan tabel perkalian agar pemain bisa menghafal
    display_multiplication_table()
    
    # Menunggu pemain siap
    input("When you are ready, press Enter to start the multiplication quiz.")
    
    # Membersihkan layar setelah pemain siap
    clear_screen()
    
    # Inisialisasi jumlah kesalahan dan skor
    mistakes = 0
    score = 0
    
    print("Starting the multiplication quiz! You have a maximum of 3 mistakes allowed.\n")
    
    try:
        # Mulai kuis
        while mistakes < 3:
            # Mengambil angka secara acak untuk soal perkalian
            num1 = random.randint(2, 9)
            num2 = random.randint(1, 9)
            correct_answer = num1 * num2
            
            # Menampilkan soal dan menerima jawaban pemain
            try:
                player_answer = int(input(f"What is {num1} x {num2}? "))
                
                # Mengecek jawaban
                if player_answer == correct_answer:
                    print("Correct! You earned 1 point.\n")
                    score += 1
                else:
                    print(f"Incorrect! The correct answer is {correct_answer}.\n")
                    mistakes += 1
                    print(f"Your mistakes: {mistakes} out of 3\n")
                    
            except ValueError:
                print("Please enter a valid number.\n")
                continue
            
            # Tunda 2 detik sebelum membersihkan layar
            time.sleep(2)
            clear_screen()
            
            # Pastikan pesan hanya muncul selama kuis aktif
            if mistakes < 3:
                print("Starting the multiplication quiz! You have a maximum of 3 mistakes allowed.\n")
    
    except KeyboardInterrupt:
        # Jika pemain menekan Ctrl + C, tampilkan papan skor tanpa menampilkan pesan kuis lagi
        print("\n\nGame stopped by the player.")
        display_scoreboard(score, mistakes)
    
    # Jika permainan berakhir karena 3 kesalahan
    if mistakes >= 3:
        print("Game Over!")
        display_scoreboard(score, mistakes)
        print("Thank you for playing!")

# Memulai permainan
if __name__ == "__main__":
    multiplication_quiz()
