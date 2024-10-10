-- Inisialisasi variabel
local score = 0
local buttonX, buttonY
local buttonWidth, buttonHeight = 200, 100

-- Fungsi untuk mengatur posisi tombol secara acak
function moveButton()
    buttonX = love.math.random(0, love.graphics.getWidth() - buttonWidth)
    buttonY = love.math.random(0, love.graphics.getHeight() - buttonHeight)
end

function love.load()
    love.window.setTitle("Moving Clicker Game")
    love.window.setMode(800, 600)
    moveButton() -- Pindahkan tombol saat mulai
end

function love.draw()
    -- Gambar latar belakang
    love.graphics.clear(1, 1, 1) -- Putih
    love.graphics.setColor(0, 0, 0) -- Hitam
    love.graphics.print("Score: " .. score, 10, 10)

    -- Gambar tombol
    love.graphics.setColor(0, 0.5, 1) -- Biru
    love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight)
    love.graphics.setColor(1, 1, 1) -- Putih
    love.graphics.printf("Click Me!", buttonX, buttonY + 35, buttonWidth, "center")
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- Klik kiri
        if x >= buttonX and x <= buttonX + buttonWidth and
           y >= buttonY and y <= buttonY + buttonHeight then
            score = score + 1 -- Tambah skor
            moveButton() -- Pindahkan tombol secara acak
        end
    end
end
