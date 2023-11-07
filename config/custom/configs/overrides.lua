local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    -- non-default
    "bash",
    "dockerfile",
    "json",
    "python",
    "rust",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cmake-language-server",
    "buildifier", -- Bazel

    -- shell
    "bash-language-server",
    "shellcheck",
    "shfmt",

    -- python
    "black",
    "mypy",
    "pyright",
    "ruff",
    "ruff-lsp",
    "isort",

    -- rust
    "rust-analyzer",

    -- docker
    "dockerfile-language-server",
    "hadolint",

    -- other markup
    "json-lsp",
    "markdownlint",
    "marksman", -- markdown
    "taplo", -- toml

    -- language
    "vale",
    "vale-ls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M
