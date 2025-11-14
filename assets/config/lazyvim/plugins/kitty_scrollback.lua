return {
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = {
			"KittyScrollbackGenerateKittens",
			"KittyScrollbackCheckHealth",
			"KittyScrollbackGenerateCommandLineEditing",
		},
		event = { "User KittyScrollbackLaunch" },
		-- version = '*', -- latest stable version, may have breaking changes if major version changed
		-- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup({
				{
					-- KsbCallbacks? fire and forget callback functions
					callbacks = {
						after_ready = function()
							vim.opt.number = true
							vim.opt.relativenumber = true
						end,
					},
					keymaps_enabled = true,
					restore_options = true,
				},
			})
		end,
	},
}
