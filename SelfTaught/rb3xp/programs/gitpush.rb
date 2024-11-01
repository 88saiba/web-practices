#!/usr/bin/env ruby

# Pastikan berada di dalam repository Git
unless Dir.exist?(".git")
  puts "Error: Not a git repository (or any of the parent directories): .git"
  exit 1
end

# Menambahkan file, commit, dan push
commit_message = ARGV[0] || "Auto commit"
system("git add .")
system("git commit -m '#{commit_message}'")

# Setup credential helper untuk menyimpan token
system("git config --global credential.helper store")

# Simpan token ke dalam file kredensial jika belum ada
credentials_file = "#{ENV['HOME']}/.git-credentials"
unless File.readlines(credentials_file).grep(/github.com/).any?
  File.open(credentials_file, "w") do |file|
    file.puts "https://88saiba:<ur-personal-access-token>@github.com" # ganti <ur-personal-access-token>, dgn PAT aktualmu
  end
end

# Melakukan push
system("git push origin main")
