require("alpha.term")

local if_nil = vim.F.if_nil

local default_terminal = {
	type = "terminal",
	command = "neo-matrix --fps=20 --speed=5 -D -m 'NEO VIM' -d 0.5 -l 1,1",
	width = 69,
	height = 15,
	opts = {
		redraw = true,
		window_config = {},
	},
}

local default_header = {
	type = "text",
	val = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	},
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}

local header = function()
	local isTerm = os.execute("command -v neo-matrix &>/dev/null")
	if isTerm == 0 then
		return default_terminal
	else
		return default_header
	end
end

local footer = {
	type = "text",
	val = "",
	opts = {
		position = "center",
		hl = "Number",
	},
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button("e", "  New file", "<cmd>ene <CR>"),
		button("SPC f f", "  Find file"),
		button("SPC f h", "  Recently opened files"),
		button("SPC f r", "  Frecency/MRU"),
		button("SPC f g", "  Find word"),
		button("SPC f m", "  Jump to bookmarks"),
		button("SPC s l", "  Open last session"),
	},
	opts = {
		spacing = 1,
	},
}

local section = {
	--terminal = default_terminal,
	header = header(),
	buttons = buttons,
	footer = footer,
}

local config = {
	layout = {
		{ type = "padding", val = 10 },
		section.header,
		{ type = "padding", val = 15 },
		section.buttons,
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

local mainConfig = {
	button = button,
	section = section,
	config = config,
	-- theme config
	leader = leader,
	-- deprecated
	opts = config,

}
require("alpha").setup(mainConfig.config)
