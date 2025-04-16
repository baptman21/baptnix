return {
	"neovim/nvim-lspconfig",
	-- Use servers already in the path instead of relying on mason
	opts = {
		servers = {
			lua_ls = { mason = false },

			svelte = { mason = false },

			nil_ls = { mason = false },

			jsonls = { mason = false },

			gopls = { mason = false },

			marksman = { mason = false },

			pyright = { mason = false },
			ruff = { mason = false },

			terraformls = { mason = false },

			ts_ls = { mason = false },
			vtsls = { mason = false },

			yamlls = { mason = false },
		},
	},
}
