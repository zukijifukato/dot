require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_root = true
	},
	sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
})
