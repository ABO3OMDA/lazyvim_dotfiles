-- lua/config/autocmds.lua
-- Add this to your existing autocmds.lua file

-- Disable inlay hints globally to prevent column out of range errors
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DisableInlayHints", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = event.buf })
    end
  end,
})

-- Additional autocmd to handle the specific error
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    -- Disable inlay hints globally
    vim.lsp.inlay_hint.enable(false)
  end,
})
