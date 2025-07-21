return {
	-- Configuration for my mind.git repo
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters = opts.formatters or {}
			opts.formatters.prettier = {
				append_args = function(_, ctx)
					local pwd = vim.loop.cwd()
					if pwd and string.find(pwd, "mind") then
						-- If in mind repo, don't read the gitignore for
						-- prettier
						return { "--ignore-path", ".prettierignore" }
					end
					return {}
				end,
			}
		end,
	},
}
