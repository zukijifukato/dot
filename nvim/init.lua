local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
require("lazy").setup("plugins")
require("core.setup")
require("core.autocmds")
require("core.keymaps")
vim.cmd("autocmd FileType * setlocal shiftwidth=2 tabstop=2")
