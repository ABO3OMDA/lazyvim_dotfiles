return {
  -- TypeScript and JavaScript LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },

  -- TypeScript tools
  {
    "jose-elias-alvarez/typescript.nvim",
    lazy = true,
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {},
    config = function(_, opts)
      require("typescript").setup({ server = opts })
    end,
    keys = {
      { "<leader>to", "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize Imports" },
      { "<leader>tR", "<cmd>TypescriptRenameFile<cr>", desc = "Rename File" },
      { "<leader>ta", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add Missing Imports" },
      { "<leader>tu", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove Unused" },
      { "<leader>tf", "<cmd>TypescriptFixAll<cr>", desc = "Fix All" },
    },
  },

  -- Better TypeScript errors
  {
    "dmmulroy/ts-error-translator.nvim",
    config = true,
  },

  -- Package info for package.json
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = true,
    event = "BufRead package.json",
  },

  -- Import cost
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh yarn",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = true,
  },
}
