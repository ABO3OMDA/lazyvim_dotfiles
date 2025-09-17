-- lua/plugins/typescript.lua
-- Optimized TypeScript configuration using built-in LSP
return {
  -- Use LazyVim's built-in vtsls (cleaner than typescript-tools)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = { completeFunctionCalls = true },
              inlayHints = { enumMemberValues = { enabled = false } },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = { completeFunctionCalls = true },
            },
          },
        },
      },
    },
  },

  -- Better TypeScript errors (lightweight)
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact" },
    config = true,
  },

  -- Package info (lazy loaded)
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    event = "BufRead package.json",
    config = true,
  },
}
