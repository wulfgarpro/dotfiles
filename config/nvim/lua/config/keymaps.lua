-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jk to escape insert mode
vim.keymap.set("i", "jk", "<ESC>")

local wk = require("which-key")
wk.add({
  { "<leader>t", group = "toggle" },
  { "<leader>tm", "<cmd>Markview toggle<CR>", mode = "n", desc = "Toggle Markview" },
  { "<leader>tt", "<cmd>TypstPreviewToggle<CR>", mode = "n", desc = "Toggle TypstPreview" },
})
