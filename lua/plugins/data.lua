return {
  -- YAML LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
                ["https://json.schemastore.org/circleciconfig"] = ".circleci/config.yml",
              },
            },
          },
        },
      },
    },
  },

  -- Prisma support
  {
    "prisma/vim-prisma",
    ft = "prisma",
  },

  -- Prisma LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        prismals = {},
      },
    },
  },
}
