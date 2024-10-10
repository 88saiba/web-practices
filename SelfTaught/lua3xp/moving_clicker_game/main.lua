-- Inisialisasi variabel
local score = 0
local buttonX, buttonY
local buttonWidth, buttonHeight = 200, 100

-- Function to randomly set button positions
function moveButton()
    buttonX = love.math.random(0, love.graphics.getWidth() - buttonWidth)
    buttonY = love.math.random(0, love.graphics.getHeight() - buttonHeight)
end

function love.load()
    love.window.setTitle("Moving Clicker Game")
    love.window.setMode(800, 600)
    moveButton() -- Move button on start
end

function love.draw()
    -- Background image
    love.graphics.clear(1, 1, 1) -- White
    love.graphics.setColor(0, 0, 0) -- Black
    love.graphics.print("Score: " .. score, 10, 10)

    -- Button image
    love.graphics.setColor(0, 0.5, 1) -- Blue
    love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight)
    love.graphics.setColor(1, 1, 1) -- White
    love.graphics.printf("Click Me!", buttonX, buttonY + 35, buttonWidth, "center")
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- Left click
        if x >= buttonX and x <= buttonX + buttonWidth and
           y >= buttonY and y <= buttonY + buttonHeight then
            score = score + 1 -- Add up the score
            moveButton() -- Move buttons randomly
        end
    end
end
