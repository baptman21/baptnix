return {
	{
		"folke/snacks.nvim",
		opts = {
			image = {
				force = false, -- try displaying the image, even if the terminal does not support it
				doc = {
					-- enable image viewer for documents
					-- a treesitter parser must be available for the enabled languages.
					enabled = true,
					-- render the image inline in the buffer
					-- if your env doesn't support unicode placeholders, this will be disabled
					-- takes precedence over `opts.float` on supported terminals
					inline = false,
					-- render the image in a floating window
					-- only used if `opts.inline` is disabled
					float = true,
					max_width = 80,
					max_height = 40,
					-- Set to `true`, to conceal the image text when rendering inline.
					-- (experimental)
					conceal = function(lang, type)
						-- only conceal math expressions
						return type == "math"
					end,
				},
				-- window options applied to windows displaying image buffers
				-- an image buffer is a buffer with `filetype=image`
				wo = {
					wrap = false,
					number = false,
					relativenumber = false,
					cursorcolumn = false,
					signcolumn = "no",
					foldcolumn = "0",
					list = false,
					spell = false,
					statuscolumn = "",
				},
				debug = {
					request = false,
					convert = false,
					placement = false,
				},
				convert = {
					notify = true, -- show a notification on error
				},
				math = {
					enabled = true, -- enable math expression rendering
				},
			},
		},
	},
	-- {
	-- 	"3rd/image.nvim",
	-- 	cond = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	-- 	build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
	-- 	opts = {
	-- 		processor = "magick_cli",
	-- 	},
	-- },
	-- {
	-- 	"3rd/diagram.nvim",
	-- 	cond = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	-- 	dependencies = {
	-- 		"3rd/image.nvim",
	-- 	},
	--
	-- 	opts = { -- you can just pass {}, defaults below
	-- 		events = {
	-- 			render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
	-- 			clear_buffer = { "BufLeave" },
	-- 		},
	-- 		renderer_options = {
	-- 			mermaid = {
	-- 				background = "transparent", -- nil | "transparent" | "white" | "#hex"
	-- 				theme = "dark", -- nil | "default" | "dark" | "forest" | "neutral"
	-- 				scale = 2, -- nil | 1 (default) | 2  | 3 | ...
	-- 				width = nil, -- nil | 800 | 400 | ...
	-- 				height = nil, -- nil | 600 | 300 | ...
	-- 			},
	-- 			plantuml = {
	-- 				charset = nil,
	-- 			},
	-- 			d2 = {
	-- 				theme_id = nil,
	-- 				dark_theme_id = nil,
	-- 				scale = nil,
	-- 				layout = nil,
	-- 				sketch = nil,
	-- 			},
	-- 			gnuplot = {
	-- 				size = nil, -- nil | "800,600" | ...
	-- 				font = nil, -- nil | "Arial,12" | ...
	-- 				theme = nil, -- nil | "light" | "dark" | custom theme string
	-- 			},
	-- 		},
	-- 	},
	-- },
}
