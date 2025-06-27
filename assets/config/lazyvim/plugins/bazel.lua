return {
	{
		"neovim/nvim-lspconfig",
		-- Use servers already in the path instead of relying on mason
		opts = {
			servers = {
				starpls = {
					enabled = true,
					mason = false,
					cmd = {
						"starpls",
						"server",
						"--experimental_infer_ctx_attributes",
						"--experimental_use_code_flow_analysis",
						"--experimental_enable_label_completions",
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "starlark" } },
	},
}
