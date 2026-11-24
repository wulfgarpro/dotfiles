-- reStructuredText / Sphinx support.
--
-- Treesitter highlighting, rstcheck linting, and prose ergonomics (soft wrap,
-- spell check, visual-line motion) — the latter handled for `rst` alongside
-- Markdown in config/autocmds.lua. RST snippets ship with friendly-snippets.
--
-- A Sphinx-aware language server (esbonio: directive/role completion,
-- cross-reference navigation, build diagnostics, live HTML preview) is left out
-- for now. To add it later: pull "esbonio" via Mason and register the server
-- with `servers = { esbonio = {} }` under nvim-lspconfig. It attaches to rst,
-- roots on conf.py, and builds docs with the project's Python — configured
-- globally in init_options (pythonCommand = { "uv", "run", "python" }) or
-- per-project in pyproject.toml ([tool.esbonio.sphinx]).
--
return {
  -- Highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "rst" })
    end,
  },

  -- Install the linter via Mason.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "rstcheck" })
    end,
  },

  -- rstcheck: lint .rst files.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        rst = { "rstcheck" },
      },
    },
  },
}
