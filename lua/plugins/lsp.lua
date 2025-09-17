-- lua/plugins/lsp.lua
-- Optimized LSP configuration - single servers only
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- Use only intelephense for PHP (more reliable than phpactor)
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              files = { maxSize = 5000000 },
              diagnostics = { enable = true },
              completion = { insertUseDeclaration = true },
            },
          },
        },

        -- ESLint for JS/TS linting
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },

        -- Docker
        dockerls = {},
        docker_compose_language_service = {},

        -- YAML with common schemas
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
              },
            },
          },
        },

        -- Prisma
        prismals = {},
      },
    },
  },
}
