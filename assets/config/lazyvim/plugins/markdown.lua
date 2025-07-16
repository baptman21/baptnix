return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
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
