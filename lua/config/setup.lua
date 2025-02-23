-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("colorscheme catppuccin")

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set background transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" }) -- Non-current windows

-- Set tab size
vim.opt.tabstop = 4         -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4      -- Number of spaces for each indentation level
vim.opt.expandtab = true    -- Convert tabs to spaces

-- Enable line numbers
vim.opt.number = true

-- Enable relatve line numbers
vim.opt.relativenumber = true

-- Enable search highlighting
vim.o.hlsearch = true


-- Reduce delay for CursorHold
vim.o.updatetime = 300

-- Create autocommand group and add CursorHold event
vim.api.nvim_create_augroup("HighlightWord", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
    group = "HighlightWord",
    callback = function()
        local word = vim.fn.expand("<cword>")
        if word ~= "" then
            vim.fn.setreg("/", "\\<" .. word .. "\\>")
        end
    end,
})

