#include <iostream>
#include <string>
#include <vector>
#include <chrono>
#include <thread>
#include <cstdlib>  // Untuk system("clear") atau system("cls")

using namespace std;

// Fungsi untuk encoding teks ke Base64
string base64_encode(const string &in) {
    static const string base64_chars = 
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    string out;
    int val = 0, valb = -6;
    
    for (unsigned char c : in) {
        val = (val << 8) + c;
        valb += 8;
        while (valb >= 0) {
            out.push_back(base64_chars[(val >> valb) & 0x3F]);
            valb -= 6;
        }
    }
    if (valb > -6) out.push_back(base64_chars[((val << 8) >> (valb + 8)) & 0x3F]);
    while (out.size() % 4) out.push_back('=');
    return out;
}

// Fungsi untuk decoding Base64
string base64_decode(const string &in) {
    static const string base64_chars = 
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    string out;
    vector<int> T(256, -1);
    for (int i = 0; i < 64; i++) T[base64_chars[i]] = i;
    
    int val = 0, valb = -8;
    for (unsigned char c : in) {
        if (T[c] == -1) break;
        val = (val << 6) + T[c];
        valb += 6;
        if (valb >= 0) {
            out.push_back(char((val >> valb) & 0xFF));
            valb -= 8;
        }
    }
    return out;
}

// Fungsi untuk substitusi karakter
char substitute_char(char c, bool reverse = false) {
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
string encrypt(const string &text) {
    // Tahap 1: Encode ke Base64
    string base64 = base64_encode(text);

    // Tahap 2: Acak Base64 menggunakan substitusi sederhana
    string scrambled;
    for (char c : base64) {
        scrambled += substitute_char(c);
    }

    return scrambled;
}

// Fungsi untuk dekripsi
string decrypt(const string &ciphertext) {
    // Tahap 1: Balik substitusi sederhana
    string unscrambled;
    for (char c : ciphertext) {
        unscrambled += substitute_char(c, true);
    }

    // Tahap 2: Decode dari Base64
    return base64_decode(unscrambled);
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
    string input_text;
    int choice;
    
    // Menampilkan menu untuk pengguna
    while (true) {
        clearScreen();  // Membersihkan layar sebelum menampilkan menu
        cout << "Menu:\n";
        cout << "1. Encryption\n";
        cout << "2. Decryption\n";
        cout << "3. Get out\n";
        cout << "Select Option: ";
        cin >> choice;
        cin.ignore(); // membersihkan buffer setelah memilih opsi
        
        if (choice == 3) {
            clearScreen();
            cout << "Thank you, exit the program.\n";
            std::this_thread::sleep_for(std::chrono::seconds(2));
            clearScreen();
            break;
        }

        // Meminta input teks dari pengguna
        clearScreen();
        cout << "Input text: ";
        getline(cin, input_text);

        if (choice == 1) {
            // Enkripsi
            string encrypted = encrypt(input_text);
            clearScreen();
            cout << "Text Encrypted: " << encrypted << endl;
        } else if (choice == 2) {
            // Dekripsi
            string decrypted = decrypt(input_text);
            clearScreen();
            cout << "Text Decrypted: " << decrypted << endl;
        } else {
            clearScreen();
            cout << "Invalid selection. Please try again.\n";
        }
        
        // Tunggu input lebih lanjut sebelum kembali ke menu
        cout << "\nPress Enter to return to the menu...";
        cin.ignore(); // Menunggu Enter sebelum kembali ke menu
    }

    return 0;
}
