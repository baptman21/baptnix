return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			checkbox = {
				enabled = true,
				right_pad = 0,
				custom = {
					important = {
						raw = "[~]",
						rendered = " ",
						highlight = "DiagnosticWarn",
					},
				},
			},
		},
	},
}
