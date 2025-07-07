return {
	{
		"Funk66/jira.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		commit = "f5c3c923bb01e241032a3fcd6e06e9c75aee0fb7",
		pin = true,
		cond = function()
			return vim.env.JIRA_API_TOKEN ~= nil
		end,
		config = function()
			require("jira").setup()
		end,
		keys = {
			{ "<leader>jv", ":JiraView<cr>", desc = "View Jira issue", silent = true },
			{ "<leader>jo", ":JiraOpen<cr>", desc = "Open Jira issue in browser", silent = true },
		},
	},
}
