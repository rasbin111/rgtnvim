vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", {desc="Neotree toggle", silent=true})


-- telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc="Telescope find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- toggleterm
-- Horizontal terminal
vim.keymap.set("n", "<Leader>th", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

-- Vertical terminal
vim.keymap.set("n", "<Leader>tv", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })

-- Floating terminal
vim.keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

-- esc to go to normal mode when using terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {noremap=true, silent=true})

