return {
	"neovim/nvim-lspconfig",
	-- Use servers already in the path instead of relying on mason
	opts = {
		servers = {
			lua_ls = { mason = false },
			ruff = { mason = false },
			terraformls = { mason = false },
		},
	},
}
