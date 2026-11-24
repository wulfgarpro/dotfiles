-- Use a global markdownlint config if one exists, otherwise fall back to
-- LazyVim's default (which discovers a project-local config, or uses
-- markdownlint's built-in defaults). Keeps the config portable: a missing
-- ~/.markdownlint-cli2.yaml no longer makes every markdown lint run error out.
local md_config = os.getenv("HOME") .. "/.markdownlint-cli2.yaml"

return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = (vim.uv or vim.loop).fs_stat(md_config) and {
          args = { "--config", md_config, "--" },
        } or nil,
      },
    },
  },
}
