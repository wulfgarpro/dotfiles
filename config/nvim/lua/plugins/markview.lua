return {
  "OXY2DEV/markview.nvim",
  -- lazy = false, -- Recommended
  lazy = true, -- See <https://github.com/OXY2DEV/markview.nvim/issues/365>.
  -- ft = { "markdown" }, -- If you decide to lazy-load anyway
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preview = {
      enable = false,
    },
  },
}
