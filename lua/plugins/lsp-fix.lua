-- lua/plugins/lsp-fixes.lua
-- Fixes for inlay hints and TypeScript issues
return {
  -- Fix inlay hints issues by disabling or configuring them properly
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false, -- Disable problematic inlay hints for now
      },
      servers = {
        -- Use vtsls instead of tsserver (more stable)
        vtsls = {
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              -- Disable inlay hints that cause issues
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              -- Disable inlay hints that cause issues
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
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

  -- Alternative TypeScript tools that work with vtsls
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup({
        on_attach = function(client, bufnr)
          -- Disable inlay hints on attach to prevent errors
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
          end
        end,
        settings = {
          -- Disable problematic features
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
}
