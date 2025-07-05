local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- PhpStorm-like keymaps
keymap.set("n", "<C-/>", "gcc", { desc = "Toggle comment", remap = true })
keymap.set("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })
keymap.set("n", "<C-d>", "yyp", opts)
keymap.set("v", "<C-d>", "y'>p", opts)
keymap.set("n", "<C-S-Up>", ":m .-2<CR>==", opts)
keymap.set("n", "<C-S-Down>", ":m .+1<CR>==", opts)
keymap.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", opts)

-- File navigation
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "<C-e>", "<cmd>Telescope oldfiles<cr>", opts)

-- Oil.nvim file explorer
keymap.set("n", "-", "<cmd>Oil<cr>", opts)
keymap.set("n", "<leader>-", "<cmd>Oil<cr>", opts)
keymap.set("n", "<leader>e", "<cmd>Oil<cr>", opts)

-- Code navigation
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
keymap.set("n", "gd", vim.lsp.buf.definition, opts)
keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
keymap.set("n", "gr", vim.lsp.buf.references, opts)
keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Debugging
keymap.set("n", "<F5>", "<cmd>DapContinue<cr>", opts)
keymap.set("n", "<F10>", "<cmd>DapStepOver<cr>", opts)
keymap.set("n", "<F11>", "<cmd>DapStepInto<cr>", opts)
keymap.set("n", "<F12>", "<cmd>DapStepOut<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>DapToggleBreakpoint<cr>", opts)

-- Window management
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
