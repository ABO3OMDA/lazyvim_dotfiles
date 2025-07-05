-- lua/plugins/lsp.lua
-- Updated consolidated LSP configuration with fixes
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable inlay hints globally to prevent the column out of range errors
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- Use vtsls instead of tsserver (more stable and maintained)
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
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
            },
          },
        },
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },

        -- PHP
        phpactor = {
          filetypes = { "php", "blade" },
          init_options = {
            ["language_server_phpstan.enabled"] = true,
            ["language_server_psalm.enabled"] = false,
          },
        },
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
            },
          },
        },

        -- Docker
        dockerls = {},
        docker_compose_language_service = {},

        -- YAML
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

        -- Prisma
        prismals = {},
      },
      setup = {
        phpactor = function(_, opts)
          if opts.capabilities then
            opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
          end
        end,
        vtsls = function(_, opts)
          -- Disable inlay hints on attach to prevent errors
          opts.on_attach = function(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
            end
          end
        end,
      },
    },
  },
}
