#!/usr/bin/env lua

-- Name: Goenv Automate Installation Script (Goenvis)
-- Author: Gillar Ajie Prasatya (88saiba)
-- Deskripsi: Skrip ini mengotomatisasi proses instalasi beberapa plugin untuk env di Golang 
-- menggunakan ASDF, dengan melakukan pengecekan untuk memastikan bahwa setiap plugin telah diinstal
-- dan diatur sebagai global sebelum melanjutkan ke plugin berikutnya.
-- skrip ini bisa anda modifikasi sesuai keinginan plugin apa yg ingin anda install menggunakan ASDF

local plugins = {
    { name = "golang", url = "https://github.com/asdf-community/asdf-golang.git" },
    { name = "gofumpt", url = "https://github.com/looztra/asdf-gofumpt.git" },
    { name = "golangci-lint", url = "https://github.com/hypnoglow/asdf-golangci-lint.git" },
    { name = "goconvey", url = "https://github.com/therounds-contrib/asdf-goconvey.git" },
}

-- Fungsi untuk menjalankan perintah shell
local function run_command(command)
    print("Running: " .. command)
    local handle = io.popen(command)
    local output = handle:read("*a")
    local success, code = handle:close()
    if not success then
        error("Command failed: " .. command .. "\nOutput: " .. output)
    end
    print(output)
end

-- Fungsi untuk memeriksa apakah plugin sudah terinstal
local function is_installed(name)
    local current = io.popen("asdf current " .. name)
    local output = current:read("*a")
    current:close()
    return output:match("%S") ~= nil  -- Kembalikan true jika ada output
end

-- Instalasi plugin satu per satu dengan pengecekan
for _, plugin in ipairs(plugins) do
    local name = plugin.name
    local url = plugin.url

    -- Tambah plugin jika belum ada
    if not is_installed(name) then
        run_command("asdf plugin add " .. name .. " " .. url)
    end

    -- Install plugin jika belum terinstal
    if not is_installed(name) then
        run_command("asdf install " .. name .. " latest")
    end

    -- Set plugin sebagai global jika belum di-set
    run_command("asdf global " .. name .. " latest")
end

print("Installation complete.")
