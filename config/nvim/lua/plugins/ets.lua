-- ArkTS/ETS support for HarmonyOS.
-- Maps .ets to typescript for treesitter + LSP, suppresses false-positive
-- diagnostics from ts_ls/vtsls since ArkTS-specific syntax isn't valid TS.
vim.filetype.add({
  extension = {
    ets = "typescript",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if vim.fn.expand("%:e") == "ets" then
      vim.diagnostic.enable(false, { bufnr = args.buf })
    end
  end,
})

return {}
