return {
  {
    "ibhagwan/fzf-lua",
    optional = true,
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")

      return vim.tbl_deep_extend("force", opts, {
        files = {
          -- Show hidden files by default (including .env)
          rg_opts = [[--color=never --files --hidden --follow -g "!.git/"]],
          fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
          actions = {
            ["alt-i"] = { actions.toggle_ignore },
            ["alt-h"] = { actions.toggle_hidden },
          },
        },
      })
    end,
  },
}
