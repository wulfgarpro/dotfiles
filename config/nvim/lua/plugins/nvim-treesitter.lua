return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  dependencies = { "OXY2DEV/markview.nvim" },
  opts = function(_, opts)
    -- Extend the default `ensure_installed` list.
    vim.list_extend(opts.ensure_installed, {
      "zig",
      "gitcommit",
    })
  end,
}
