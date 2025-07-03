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
	},
}
