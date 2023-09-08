-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.colorcolumn = "80"

-- Treat some files as other files
vim.cmd [[ 
  autocmd BufRead,BufNewFile Containerfile set filetype=dockerfile
]]

-- Apply ExtraWhitespace only to certain file types
vim.cmd [[
  autocmd FileType cpp,c,python,markdown,tex,lua,gitcommit,yaml,json,dockerfile,plaintex,rust,cmake,clang-format,clang-tidy match ExtraWhitespace /\s\+$/
  autocmd FileType cpp,c,python,markdown,tex,lua,gitcommit,yaml,json,dockerfile,plaintex,rust,cmake,clang-format,clang-tidy autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd FileType cpp,c,python,markdown,tex,lua,gitcommit,yaml,json,dockerfile,plaintex,rust,cmake,clang-format,clang-tidy autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd FileType cpp,c,python,markdown,tex,lua,gitcommit,yaml,json,dockerfile,plaintex,rust,cmake,clang-format,clang-tidy autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd FileType cpp,c,python,markdown,tex,lua,gitcommit,yaml,json,dockerfile,plaintex,rust,cmake,clang-format,clang-tidy autocmd BufWinLeave * call clearmatches()
]]
