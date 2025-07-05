return {
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
			colors = {
				-- Iris colors, cf ../../../themes/iris
				green = "#36b32d",
				purple = "#956ad3",
				yellow = "#e1a51c",
				cyan = "#1dcae0",
				bg_d = "#272537", -- set same color as background for transparency
			},
			highlights = {
				DashboardHeader = { fg = "$purple" }, -- color for dashboard-nvim
			},
		},
	},
}
