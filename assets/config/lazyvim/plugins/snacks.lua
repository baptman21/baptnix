return {
	{
		"snacks.nvim",
		opts = {
			picker = {
				win = {
					input = {
						keys = {
							["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
							["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
							["<c-w>"] = { "cycle_win", mode = { "i", "n" } },
						},
					},
				},
				formatters = {
					file = {
						filename_first = true, -- display filename before the file path
						truncate = 999, -- truncate the file path to (roughly) this length
					},
				},
			},
		},
		keys = {
			{
				"<leader>sP",
				function()
					require("snacks").picker.pickers()
				end,
				desc = "Snacks Pickers",
			},
			{
				"<C-G>",
				function()
					require("snacks").picker.pick({
						source = "files",
						confirm = "put",
					})
				end,
				desc = "Files picker from command",
				mode = "c",
			},
		},
	},
}
