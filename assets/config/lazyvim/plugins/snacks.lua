return {
	{
		"snacks.nvim",
		opts = {
			picker = {
				win = {
					input = {
						keys = {
							["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
							["<c-w>"] = { "cycle_win", mode = { "i", "n" } },
						},
					},
				},
				list = {
					input = {
						keys = {},
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
