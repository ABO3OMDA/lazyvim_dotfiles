return {
  -- Docker LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
      },
    },
  },

  -- Dockerfile syntax
  {
    "ekalinin/Dockerfile.vim",
    ft = "dockerfile",
  },

  -- Docker commands integration
  {
    "dgrbrady/nvim-docker",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>dc", "<cmd>DockerContainers<cr>", desc = "Docker Containers" },
      { "<leader>di", "<cmd>DockerImages<cr>", desc = "Docker Images" },
    },
  },
}
