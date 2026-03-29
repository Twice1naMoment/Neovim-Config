vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Keybind for executing files
local function compile_and_run()
    vim.cmd('write')
    local ft = vim.bo.filetype

    if ft == 'c' then
        local cmd = 'cd "' ..
            vim.fn.expand('%:p:h') ..
            '" && gcc "' ..
            vim.fn.expand('%:t') ..
            '" -o "' .. vim.fn.expand('%:t:r') .. '" && ./"' .. vim.fn.expand('%:t:r') .. '"'
        vim.cmd('split | terminal ' .. cmd)
    elseif ft == 'cpp' then
        -- Add C++ support
        local cmd = 'cd "' ..
            vim.fn.expand('%:p:h') ..
            '" && g++ "' ..
            vim.fn.expand('%:t') ..
            '" -o "' .. vim.fn.expand('%:t:r') .. '" && ./"' .. vim.fn.expand('%:t:r') .. '"'
        vim.cmd('split | terminal ' .. cmd)
        -- Python support
    elseif ft == 'py' then
        local cmd = 'cd "' ..
            vim.fn.expand('%:p:h') ..
            '" && python "' ..
            vim.fn.expand('%:t') ..
            '" -o "' .. vim.fn.expand('%:t:r') .. '" && ./"' .. vim.fn.expand('%:t:r') .. '"'
        vim.cmd('split | terminal ' .. cmd)
        -- JS support
    elseif ft == 'js' then
        local cmd = 'cd "' ..
            vim.fn.expand('%:p:h') ..
            '" && node "' ..
            vim.fn.expand('%:t') ..
            '" -o "' .. vim.fn.expand('%:t:r') .. '" && ./"' .. vim.fn.expand('%:t:r') .. '"'
        vim.cmd('split | terminal ' .. cmd)
    else
        print('No compile/run command for filetype: ' .. ft)
    end
end

vim.keymap.set("n", "<leader>x", compile_and_run, { noremap = true, silent = true })
