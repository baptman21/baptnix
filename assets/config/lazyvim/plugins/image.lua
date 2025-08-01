return {
	{
		"3rd/image.nvim",
		cond = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			processor = "magick_cli",
		},
	},
	{
		"3rd/diagram.nvim",
		cond = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
		dependencies = {
			"3rd/image.nvim",
		},

		opts = { -- you can just pass {}, defaults below
			events = {
				render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
				clear_buffer = { "BufLeave" },
			},
			renderer_options = {
				mermaid = {
					background = "transparent", -- nil | "transparent" | "white" | "#hex"
					theme = "dark", -- nil | "default" | "dark" | "forest" | "neutral"
					scale = 2, -- nil | 1 (default) | 2  | 3 | ...
					width = nil, -- nil | 800 | 400 | ...
					height = nil, -- nil | 600 | 300 | ...
				},
				plantuml = {
					charset = nil,
				},
				d2 = {
					theme_id = nil,
					dark_theme_id = nil,
					scale = nil,
					layout = nil,
					sketch = nil,
				},
				gnuplot = {
					size = nil, -- nil | "800,600" | ...
					font = nil, -- nil | "Arial,12" | ...
					theme = nil, -- nil | "light" | "dark" | custom theme string
				},
			},
		},
	},
}
