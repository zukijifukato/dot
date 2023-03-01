local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NvimTree
map("n", "<leader>ntt", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- LSP
-- plugins/config/lsp.lua

-- Fugitive
map("n", "<leader>gs", vim.cmd.Git)

-- Zen Mode
map("n", "<leader>zm", ":ZenMode<CR>", opts)

-- Persistence
map("n", "<leader>pl", function() require("persistence").load() end, opts)
map("n", "<leader>pll", function() require("persistence").load({ last = true }) end, opts)
map("n", "<leader>ps", function() require("persistence").stop() end, opts)
