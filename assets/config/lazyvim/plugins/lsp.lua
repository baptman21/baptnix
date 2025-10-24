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
			setup = {
				metals = function(_, opts)
					local metals = require("metals")
					local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), opts)
					metals_config.on_attach = LazyVim.has("nvim-dap") and metals.setup_dap or nil

					local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
					vim.api.nvim_create_autocmd("FileType", {
						pattern = { "scala", "sbt" },
						callback = function()
							metals.initialize_or_attach(metals_config)
							vim.notify("Metals initialized")
						end,
						group = nvim_metals_group,
					})
					return true
				end,
			},
		},
	},
}
