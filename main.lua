
-- Define a function to execute when an action is completed
deezAction = 0
function ondeezActionCompleted()
    -- print("Action completed! - ",deezAction)
    -- Add your logic here
    deezAction = deezAction +1
end

-- Define a function to attach event listeners
local function attachEventListeners()
    -- Listen for changes in the cursor position (movement actions)
    vim.api.nvim_command("autocmd CursorMoved * lua ondeezActionCompleted()")

    -- Listen for changes in the current buffer (e.g., undo, delete actions)
    vim.api.nvim_command("autocmd TextChanged,TextChangedI * lua ondeezActionCompleted()")

    -- Listen for yanking current buffer (e.g.,yank actions)
    vim.api.nvim_command("autocmd TextYankPost * lua ondeezActionCompleted()")
end

-- Attach event listeners when Neovim starts
attachEventListeners()


local function printMessage()
    print("APM - ",deezAction)
    deezAction = 0
end

-- Define a timer to print the message every minute
local timer_id = vim.loop.new_timer()

local function setupTimer()
    timer_id:start(60000, 0, vim.schedule_wrap(printMessage))
end

-- Call the setup function when Neovim starts
setupTimer()
