return {
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "dark",
			transparent = true,
			highlights = {
				-- TODO: remove when fixed
				-- Cf. https://github.com/navarasu/onedark.nvim/issues/251#issuecomment-3544178336
				["@nospell"] = { fg = "none" },
				["@spell"] = { fg = "none" },
				SnacksDashboardHeader = { fg = "$purple" }, -- color for snacks dashboard

				RenderMarkdownH1Bg = { bg = "$purple" },
				RenderMarkdownH2Bg = { bg = "$red" },
				RenderMarkdownH3Bg = { bg = "$blue" },
				RenderMarkdownH4Bg = { bg = "$purple" },
			},
		},
	},
}
