-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit" },
  command = [[
    set colorcolumn=+0
    set colorcolumn+=50
  ]]
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "gitcommit" and vim.bo.textwidth > 0 then
      vim.wo.colorcolumn = "+0"
    end
  end
})
