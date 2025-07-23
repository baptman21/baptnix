return {
	{
		"neovim/nvim-lspconfig",
		-- Use servers already in the path instead of relying on mason
		opts = {
			servers = {
				metals = {
					settings = {
						useGlobalExecutable = true,
					},
				},
			},
		},
	},
}
