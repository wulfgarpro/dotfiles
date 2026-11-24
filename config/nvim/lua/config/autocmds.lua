-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit" },
  command = [[
    set colorcolumn=+0
    set colorcolumn+=50
  ]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "gitcommit" and vim.bo.textwidth > 0 then
      vim.wo.colorcolumn = "+0"
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown", "rst" },
  command = [[
    set colorcolumn=+0
    set colorcolumn+=100
  ]],
})

-- Prose-friendly editing for Markdown and reStructuredText (Sphinx) files:
-- soft-wrap at 100 columns, navigate by visual lines, and turn on spell check.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "rst" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.textwidth = 100
    vim.opt_local.showbreak = "↪ "
    vim.opt_local.spell = true
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })
  end,
})
