-- lua/plugins/typescript.lua
-- Updated TypeScript configuration that works with vtsls
return {
  -- Modern TypeScript tools (replaces the old typescript.nvim)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          -- Disable inlay hints to prevent errors
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
          end
        end,
        settings = {
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "none",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = false,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = false,
          },
        },
      })
    end,
    keys = {
      { "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
      { "<leader>tR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
      { "<leader>ta", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
      { "<leader>tu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused" },
      { "<leader>tf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
    },
  },

  -- Disable the old typescript.nvim to prevent conflicts
  {
    "jose-elias-alvarez/typescript.nvim",
    enabled = false,
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
