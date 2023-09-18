vim.opt.colorcolumn = "80"

-- Treat some files as other files.
vim.cmd [[ 
  autocmd BufRead,BufNewFile Containerfile set filetype=dockerfile
]]

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Don't fold by default.
vim.opt.foldenable = false

-- Decrease update time.
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience.
vim.completeopt = "menuone,noselect"

-- Highlight extra whitespace.
vim.cmd [[
  autocmd BufEnter,BufRead * match Error /\s\+$/
  autocmd BufWritePre * silent! call matchdelete(//)
]]
