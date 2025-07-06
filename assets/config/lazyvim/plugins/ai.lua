return {

	{
		"saghen/blink.cmp",
		dependencies = { "giuxtaposition/blink-cmp-copilot" },
		opts = {
			sources = {
				providers = {
					copilot = {
						name = "copilot",
						score_offset = -40,
					},
				},
			},
		},
	},
}
