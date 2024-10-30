return {
	"neovim/nvim-lspconfig",
	-- Use servers already in the path instead of relying on mason
	opts = {
		servers = {
			lua_ls = { mason = false },

			ruff = { mason = false },
			ruff_lsp = { mason = false },

			terraformls = { mason = false },

			ts_ls = { mason = false },
			tsserver = { mason = false },
			vtsls = { mason = false },

			yamlls = { mason = false },
		},
	},
}
