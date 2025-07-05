-- lua/plugins/formatting.lua
-- Updated formatting configuration with vtsls
return {
  -- Formatter configuration
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
        php = { "php_cs_fixer", "pint" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        docker = { "dockerfile" },
        prisma = { "prisma" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        markdown = { "prettier" },
      },
      default_format_opts = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },

  -- Install formatters and language servers
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "blade-formatter",
        "prettier",
        "php-cs-fixer",
        "pint",
        "prisma-language-server",
        "vtsls", -- Use vtsls instead of typescript-language-server
        "dockerfile-language-server",
        "docker-compose-language-service",
        "yaml-language-server",
        "eslint-lsp",
        "phpactor",
        "intelephense",
      })
    end,
  },
}
