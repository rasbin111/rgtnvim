if vim.g.neovide then
    vim.cmd("colorscheme nordic")
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    vim.g.neovide_transparency = 0.8 -- Set window transparency (0 = fully transparent, 1 = solid)
    vim.g.transparency = 0.8 -- Set background transparency
    -- vim.g.neovide_font_features = { "calt", "liga" }
    -- vim.g.neovide_cursor_vfx_mode = "railgun"  -- Other modes: torpedo, pixiedust, sonicboom
end
