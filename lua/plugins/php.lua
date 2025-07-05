return {
  -- PHP LSP and tools
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          keys = {
            { "<leader>ca", "<cmd>PhpActor context_menu<cr>", desc = "PHP Actor Menu" },
            { "<leader>cr", "<cmd>PhpActor transform<cr>", desc = "PHP Transform" },
          },
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
      },
      setup = {
        phpactor = function(_, opts)
          opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
        end,
      },
    },
  },

  -- PHP Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "phpdoc",
        "html",
        "css",
        "javascript",
        "vue",
        "blade",
      })
    end,
  },

  -- PHP Debug Adapter
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    opts = function()
      local dap = require("dap")
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
      }
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }
    end,
  },

  -- PHP Test Runner
  {
    "vim-test/vim-test",
    opts = {
      setup = {},
    },
    config = function(_, opts)
      vim.g["test#php#phpunit#executable"] = "./vendor/bin/phpunit"
      vim.g["test#php#pest#executable"] = "./vendor/bin/pest"
    end,
    keys = {
      { "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test File" },
      { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Test Suite" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Test Last" },
    },
  },

  -- Laravel specific
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "kevinhwang91/promise-async", -- Add this missing dependency
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":Laravel related<cr>", desc = "Laravel Related" },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
    end,
  },

  -- Blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- Database client
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Database UI" },
    },
  },

  -- PHP namespace handling
  {
    "arnaud-lb/vim-php-namespace",
    ft = "php",
    keys = {
      { "<leader>u", "<cmd>call phpnamespace#complete('')<cr>", desc = "PHP Use Class" },
      { "<leader>e", "<cmd>call phpnamespace#expand_class()<cr>", desc = "PHP Expand Class" },
    },
  },
}
