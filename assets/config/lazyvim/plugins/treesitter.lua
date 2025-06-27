return {
	{
		"nvim-treesitter/nvim-treesitter",
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.ensure_installed, "go")
			table.insert(opts.ensure_installed, "helm")
		end,
	},
}
