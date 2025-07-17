return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			code = {
				border = "thin",
			},
			checkbox = {
				enabled = true,
				unchecked = {
					icon = "   󰄱 ",
				},
				checked = {
					icon = "   󰱒 ",
				},
				custom = {
					important = {
						raw = "[~]",
						rendered = "    ",
						highlight = "DiagnosticWarn",
					},
					todo = {
						rendered = "   󰥔 ",
					},
				},
			},
		},
	},
}
