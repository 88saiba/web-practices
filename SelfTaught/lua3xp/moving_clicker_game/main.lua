-- Initialize variables
local score = 0
local buttonX, buttonY
local buttonWidth, buttonHeight = 100, 50 -- Initial button size
local gameOver = false
local timeLeft = 3 -- Starting time in seconds
local timerStarted = false

-- Function to set the button's position randomly
function moveButton()
    buttonX = love.math.random(0, love.graphics.getWidth() - buttonWidth)
    buttonY = love.math.random(0, love.graphics.getHeight() - buttonHeight)
end

-- Function to decrease the button size
function decreaseButtonSize()
    buttonWidth = buttonWidth * 0.9 -- Decrease width by 10%
    buttonHeight = buttonHeight * 0.9 -- Decrease height by 10%
end

function love.load()
    love.window.setTitle("Moving Clicker Game")
    love.window.setMode(800, 600)
    moveButton() -- Move the button when starting the game
end

function love.update(dt)
    if not gameOver then
        -- Update the timer
        timeLeft = timeLeft - dt
        if timeLeft <= 0 then
            gameOver = true -- End the game if time runs out
        end
    end
end

function love.draw()
    -- Clear the background
    love.graphics.clear(1, 1, 1) -- White
    love.graphics.setColor(0, 0, 0) -- Black
    love.graphics.print("Score: " .. score, 10, 10)
    love.graphics.print("Time Left: " .. math.ceil(timeLeft), 10, 30) -- Display time left

    if gameOver then
        love.graphics.setColor(1, 0, 0) -- Red for game over
        love.graphics.print("Game Over!", love.graphics.getWidth() / 2 - 50, love.graphics.getHeight() / 2 - 20)
        love.graphics.print("Final Score: " .. score, love.graphics.getWidth() / 2 - 70, love.graphics.getHeight() / 2 + 10)
        love.graphics.setColor(0, 0.5, 1) -- Blue for return button
        love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - 75, love.graphics.getHeight() / 2 + 50, 150, 40)
        love.graphics.setColor(1, 1, 1) -- White
        love.graphics.printf("Play Again", love.graphics.getWidth() / 2 - 75, love.graphics.getHeight() / 2 + 55, 150, "center")
    else
        -- Draw the button
        love.graphics.setColor(0, 0.5, 1) -- Blue
        love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight)
        love.graphics.setColor(1, 1, 1) -- White
        love.graphics.printf("Here!", buttonX, buttonY + 15, buttonWidth, "center")
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- Left click
        if gameOver then
            -- Check if clicked on the return button
            if x >= love.graphics.getWidth() / 2 - 75 and x <= love.graphics.getWidth() / 2 + 75 and
               y >= love.graphics.getHeight() / 2 + 50 and y <= love.graphics.getHeight() / 2 + 90 then
                -- Restart the game
                score = 0
                timeLeft = 3 -- Reset time
                buttonWidth, buttonHeight = 100, 50 -- Reset button size
                gameOver = false
                moveButton() -- Move the button again
            end
        else
            -- Check if clicked on the button
            if x >= buttonX and x <= buttonX + buttonWidth and
               y >= buttonY and y <= buttonY + buttonHeight then
                score = score + 1 -- Increase score
                timeLeft = timeLeft + 1 -- Add 1 seconds to the timer
                decreaseButtonSize() -- Decrease button size
                moveButton() -- Move button randomly
            else
                -- Game over if missed the button
                gameOver = true
            end
        end
    end
end
