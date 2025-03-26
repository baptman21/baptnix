return {
	{
		"neovim/nvim-lspconfig",
		-- Use servers already in the path instead of relying on mason
		opts = {
			servers = {
				jsonnet_ls = {
					enabled = true,
					mason = false,
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "jsonnet" } },
	},
}
