local autocmd = vim.api.nvim_create_autocmd

autocmd("VimLeave", {
  command = "set guicursor=a:ver20"
})

local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    return
  end

  vim.cmd.enew()
  vim.cmd.bw(data.buf)
  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end

autocmd("VimEnter", {
	callback = open_nvim_tree
})

vim.cmd [[autocmd FileType * set formatoptions-=ro]]
