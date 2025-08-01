return {
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gvdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
		keys = {
			{ "<leader>g2", "<cmd>diffget //2<CR>", desc = "Get the change on the left." },
			{ "<leader>g3", "<cmd>diffget //3<CR>", desc = "Get the change on the right." },
			{ "<leader>g4", "<cmd>diffput<CR>", desc = "Get the change off the diff (diffput)." },
		},
	},
}
