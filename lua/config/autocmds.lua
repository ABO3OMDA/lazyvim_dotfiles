-- lua/config/autocmds.lua
-- Optimized autocmds

-- Disable inlay hints globally
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DisableInlayHints", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = event.buf })
    end
  end,
})

-- Performance optimizations
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.lsp.inlay_hint.enable(false)
    -- Reduce updatetime for better performance
    vim.opt.updatetime = 250
  end,
})
