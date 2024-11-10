import curses
import random
import time

# Setup layar
stdscr = curses.initscr()
curses.curs_set(0)  # Menyembunyikan kursor
sh, sw = stdscr.getmaxyx()
w = curses.newwin(sh, sw, 0, 0)
w.keypad(1)
w.timeout(100)

# Catcher dan papan permainan
catcher = '^'
catcher_pos = [sh//2, sw//2]
direction = curses.KEY_RIGHT
food = '0'  # Makanan yang benar sekarang angka 0
wrong_item = 'O'  # Item salah menggunakan O besar
food_pos = [random.randint(1, sh-2), random.randint(1, sw-2)]
wrong_item_pos = [random.randint(1, sh-2), random.randint(1, sw-2)]

# Skor dan kecepatan permainan
score = 0
speed = 100  # Timeout awal

# Game loop
while True:
    next_key = w.getch()
    if next_key == 27:  # Escape untuk keluar
        break
    
    # Gerakan Catcher
    if next_key == curses.KEY_UP:
        direction = curses.KEY_UP
    elif next_key == curses.KEY_DOWN:
        direction = curses.KEY_DOWN
    elif next_key == curses.KEY_LEFT:
        direction = curses.KEY_LEFT
    elif next_key == curses.KEY_RIGHT:
        direction = curses.KEY_RIGHT
    
    if direction == curses.KEY_UP:
        catcher_pos[0] -= 1
    elif direction == curses.KEY_DOWN:
        catcher_pos[0] += 1
    elif direction == curses.KEY_LEFT:
        catcher_pos[1] -= 1
    elif direction == curses.KEY_RIGHT:
        catcher_pos[1] += 1
    
    # Membatasi pergerakan catcher di dalam layar
    catcher_pos[0] = max(1, min(sh-2, catcher_pos[0]))
    catcher_pos[1] = max(1, min(sw-2, catcher_pos[1]))

    # Pembersihan layar dan menggambar objek
    w.clear()
    w.addch(catcher_pos[0], catcher_pos[1], catcher)
    w.addch(food_pos[0], food_pos[1], food)
    w.addch(wrong_item_pos[0], wrong_item_pos[1], wrong_item)

    # Menambahkan makanan baru jika catcher memakan makanan yang benar
    if catcher_pos == food_pos:
        score += 10  # Menambah skor jika catcher makan makanan yang benar
        food_pos = [random.randint(1, sh-2), random.randint(1, sw-2)]  # Makanan baru
        wrong_item_pos = [random.randint(food_pos[0]-1, food_pos[0]+1), random.randint(food_pos[1]-1, food_pos[1]+1)]  # Item salah baru, lebih dekat dengan makanan
        speed = max(59, speed - 5)  # Meningkatkan kecepatan permainan (mengurangi timeout)

    # Game Over jika catcher memakan item yang salah
    if catcher_pos == wrong_item_pos:
        w.addstr(sh//2, sw//2 - len("GAME OVER")//2, "GAME OVER", curses.A_BOLD)
        w.refresh()
        time.sleep(2)  # Menunggu 2 detik sebelum keluar
        break
    
    # Menampilkan skor
    w.addstr(0, 2, f"Score: {score}")

    # Refresh layar dengan kecepatan yang disesuaikan
    w.refresh()
    w.timeout(speed)  # Kecepatan permainan bertambah dengan setiap makanan yang dimakan

curses.endwin()
