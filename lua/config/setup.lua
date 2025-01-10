-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set tab size
vim.opt.tabstop = 4         -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4      -- Number of spaces for each indentation level
vim.opt.expandtab = true    -- Convert tabs to spaces

-- Enable line numbers
vim.opt.number = true

-- Enable relatve line numbers
vim.opt.relativenumber = true
