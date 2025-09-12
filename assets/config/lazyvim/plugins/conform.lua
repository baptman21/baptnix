return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters = opts.formatters or {}
			opts.formatters.prettier = opts.formatters.prettier or {}
			opts.formatters.prettier = {
				condition = function(_, ctx)
					local filename = ctx.filename or ""
					return not string.find(filename, "lakebase%-docs")
				end,
			}
		end,
	},
}
