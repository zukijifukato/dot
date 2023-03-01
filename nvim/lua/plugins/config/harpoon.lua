local map = vim.keymap.set

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "a", mark.add_file)
map("n", "th", ui.toggle_quick_menu)

map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-t>", function() ui.nav_file(2) end)
map("n", "<C-n>", function() ui.nav_file(2) end)
map("n", "<C-s>", function() ui.nav_file(2) end)
