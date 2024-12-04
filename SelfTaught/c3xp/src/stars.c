#include <ncurses.h>
#include <stdlib.h>
#include <time.h>   // untuk nanosleep

#define WIDTH 50
#define HEIGHT 20

// Fungsi untuk menginisialisasi warna bintang
void init_colors() {
    start_color();
    init_pair(1, COLOR_BLUE, COLOR_BLACK);   // Biru
    init_pair(2, COLOR_RED, COLOR_BLACK);    // Merah
    init_pair(3, COLOR_YELLOW, COLOR_BLACK); // Kuning
    init_pair(4, COLOR_GREEN, COLOR_BLACK);  // Hijau
    init_pair(5, COLOR_WHITE, COLOR_BLACK);  // Putih
}

// Fungsi untuk membuat bintang dengan warna acak
void draw_flame() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            int rand_color = rand() % 5 + 1;  // Menghasilkan angka 1-5 untuk warna
            attron(COLOR_PAIR(rand_color));    // Menggunakan warna yang dipilih
            mvprintw(y, x, "*");              // Menampilkan bintang (*)
            attroff(COLOR_PAIR(rand_color));   // Menonaktifkan warna setelah mencetak
        }
    }
}

// Fungsi untuk delay dalam milidetik menggunakan nanosleep
void sleep_ms(long milliseconds) {
    struct timespec req = { 0 };
    time_t sec = (long)(milliseconds / 1000);
    milliseconds = milliseconds % 1000;
    req.tv_sec = sec;
    req.tv_nsec = milliseconds * 1000000L;

    nanosleep(&req, (struct timespec *)NULL);
}

int main() {
    // Inisialisasi ncurses
    initscr();
    noecho();
    cbreak();
    curs_set(0);  // Sembunyikan kursor
    timeout(0);   // Set timeout untuk getch(), agar tidak menunggu input

    // Inisialisasi warna
    init_colors();

    int ch;
    // Loop untuk menggambar gemerlap
    while (1) {
        ch = getch();  // Ambil input dari pengguna

        if (ch == 27) {  // Jika tombol Esc ditekan, keluar dari program
            break;
        }

        clear();  // Hapus layar sebelumnya
        draw_flame();  // Gambar efek
        refresh();  // Segarkan layar

        sleep_ms(100);  // Delay 100ms menggunakan nanosleep
    }

    // Kembalikan terminal ke mode normal sebelum keluar
    endwin();
    return 0;
}
