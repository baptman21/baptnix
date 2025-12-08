return {
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				providers = {
					copilot = {
						name = "copilot",
						score_offset = -40,
					},
				},
			},
		},
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			auto_start = true,
			log_level = "info", -- "trace", "debug", "info", "warn", "error"
			terminal_cmd = "~/.claude/custom",
			-- When true, successful sends will focus the Claude terminal if already connected
			focus_after_send = false,

			-- Selection Tracking
			track_selection = true,
			visual_demotion_delay_ms = 50,

			-- Terminal Configuration
			terminal = {
				split_side = "right", -- "left" or "right"
				split_width_percentage = 0.30,
				provider = "auto", -- "auto", "snacks", "native", "external", "none", or custom provider table
				auto_close = true,
			},

			-- Diff Integration
			diff_opts = {
				auto_close_on_accept = true,
				vertical_split = true,
				open_in_current_tab = true,
				keep_terminal_focus = false, -- If true, moves focus back to terminal after diff opens
			},

			snacks_opts = {
				keys = {
					claude_hide_ctrl = {
						"<C-,>",
						function(self)
							self:hide()
						end,
						mode = "t",
						desc = "Hide (Ctrl+,)",
					},
				},
			},
		},
		keys = {
			{ "<leader>tcc", "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Claude", mode = { "n", "x" } },
			{ "<leader>tcs", "<cmd>ClaudeCodeSend<cr>", desc = "Claude Send current postision", mode = { "n", "x" } },
		},
	},
}
