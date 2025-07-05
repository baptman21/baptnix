return {
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
			transparent = true,
			colors = {
				-- Iris colors, cf ../../../themes/iris
				green = "#36b32d",
				purple = "#956ad3",
				yellow = "#e1a51c",
				cyan = "#1dcae0",
			},
			highlights = {
				DashboardHeader = { fg = "$purple" }, -- color for dashboard-nvim
			},
		},
	},
}
