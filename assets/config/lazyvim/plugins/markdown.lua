return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			checkbox = {
				enabled = true,
				right_pad = 2,
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
