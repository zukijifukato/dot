require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "html", "css", "python", "lua", "c", "cpp", "rust", "go", "vim" },
	sync_install = true,
	auto_install = false,
	ignore_insall = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false
	},
  indent = { enable = true },
})
