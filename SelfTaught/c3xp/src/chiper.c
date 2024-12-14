#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>  // Untuk sleep (tidak tersedia di Windows)
#include <ctype.h>

// Fungsi untuk encoding teks ke Base64
char* base64_encode(const char *in) {
    static const char base64_chars[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    char *out = malloc(((strlen(in) + 2) / 3) * 4 + 1);  // Mengalokasi ruang untuk hasil base64
    int val = 0, valb = -6, out_index = 0;

    for (size_t i = 0; i < strlen(in); i++) {
        unsigned char c = in[i];
        val = (val << 8) + c;
        valb += 8;
        while (valb >= 0) {
            out[out_index++] = base64_chars[(val >> valb) & 0x3F];
            valb -= 6;
        }
    }
    if (valb > -6) out[out_index++] = base64_chars[((val << 8) >> (valb + 8)) & 0x3F];
    while (out_index % 4) out[out_index++] = '=';  // Padding dengan '='
    out[out_index] = '\0';
    
    return out;
}

// Fungsi untuk decoding Base64
char* base64_decode(const char *in) {
    static const char base64_chars[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    int T[256];
    for (int i = 0; i < 256; i++) T[i] = -1;
    for (int i = 0; i < 64; i++) T[(unsigned char) base64_chars[i]] = i;

    char *out = malloc(strlen(in) * 3 / 4 + 1);
    int val = 0, valb = -8, out_index = 0;
    
    for (size_t i = 0; i < strlen(in); i++) {
        unsigned char c = in[i];
        if (T[c] == -1) break;
        val = (val << 6) + T[c];
        valb += 6;
        if (valb >= 0) {
            out[out_index++] = (val >> valb) & 0xFF;
            valb -= 8;
        }
    }
    out[out_index] = '\0';
    return out;
}

// Fungsi untuk substitusi karakter
char substitute_char(char c, int reverse) {
    if (reverse) {
        if (c >= 'A' && c <= 'Z') return (char)(((c - 'A' - 3 + 26) % 26) + 'A');
        if (c >= 'a' && c <= 'z') return (char)(((c - 'a' - 5 + 26) % 26) + 'a');
        if (c >= '0' && c <= '9') return (char)(((c - '0' - 7 + 10) % 10) + '0');
        if (c == '-') return '+';
        if (c == '_') return '/';
    } else {
        if (c >= 'A' && c <= 'Z') return (char)(((c - 'A' + 3) % 26) + 'A');
        if (c >= 'a' && c <= 'z') return (char)(((c - 'a' + 5) % 26) + 'a');
        if (c >= '0' && c <= '9') return (char)(((c - '0' + 7) % 10) + '0');
        if (c == '+') return '-';
        if (c == '/') return '_';
    }
    return c;
}

// Fungsi untuk enkripsi
char* encrypt(const char *text) {
    // Tahap 1: Encode ke Base64
    char *base64 = base64_encode(text);

    // Tahap 2: Acak Base64 menggunakan substitusi sederhana
    char *scrambled = malloc(strlen(base64) + 1);
    for (size_t i = 0; i < strlen(base64); i++) {
        scrambled[i] = substitute_char(base64[i], 0);
    }
    scrambled[strlen(base64)] = '\0';
    free(base64);

    return scrambled;
}

// Fungsi untuk dekripsi
char* decrypt(const char *ciphertext) {
    // Tahap 1: Balik substitusi sederhana
    char *unscrambled = malloc(strlen(ciphertext) + 1);
    for (size_t i = 0; i < strlen(ciphertext); i++) {
        unscrambled[i] = substitute_char(ciphertext[i], 1);
    }
    unscrambled[strlen(ciphertext)] = '\0';

    // Tahap 2: Decode dari Base64
    char *decoded = base64_decode(unscrambled);
    free(unscrambled);

    return decoded;
}

// Fungsi untuk membersihkan layar
void clearScreen() {
    #ifdef _WIN32
        system("cls");  // Untuk Windows
    #else
        system("clear");  // Untuk Linux/macOS
    #endif
}

int main() {
    char input_text[1024];
    int choice;

    while (1) {
        clearScreen();
        printf("Menu:\n");
        printf("1. Encryption\n");
        printf("2. Decryption\n");
        printf("3. Exit\n");
        printf("Select Option: ");
        scanf("%d", &choice);
        getchar();  // Membersihkan newline setelah input pilihan

        if (choice == 3) {
            clearScreen();
            printf("Thank you, exiting the program.\n");
            sleep(2);
            clearScreen();
            break;
        }

        clearScreen();
        printf("Input text: ");
        fgets(input_text, sizeof(input_text), stdin);
        input_text[strcspn(input_text, "\n")] = '\0';  // Menghapus newline

        if (choice == 1) {
            // Enkripsi
            char *encrypted = encrypt(input_text);
            clearScreen();
            printf("Text Encrypted: %s\n", encrypted);
            free(encrypted);
        } else if (choice == 2) {
            // Dekripsi
            char *decrypted = decrypt(input_text);
            clearScreen();
            printf("Text Decrypted: %s\n", decrypted);
            free(decrypted);
        } else {
            clearScreen();
            printf("Invalid selection. Please try again.\n");
        }

        // Tunggu input lebih lanjut sebelum kembali ke menu
        printf("\nPress Enter to return to the menu...");
        getchar(); // Menunggu Enter sebelum kembali ke menu
    }

    return 0;
}
