vim.api.nvim_create_user_command("F", function(opts)
	require("snacks").picker.files({
		cwd = opts.fargs[1],
	})
end, { nargs = 1 })

return {
	{
		"snacks.nvim",
		opts = {
			picker = {
				actions = {
					list_scroll_left = function(picker)
						picker.list.win:hscroll(true)
					end,
					toggle_wrap = function(picker)
						vim.api.nvim_win_call(picker.list.win.win, function()
							vim.cmd("set wrap!")
						end)
					end,
					list_scroll_right = function(picker)
						picker.list.win:hscroll()
					end,
				},
				sources = {
					explorer = {
						auto_close = true,
						layout = {
							preset = "default",
						},
						matcher = {
							fuzzy = true,
							smartcase = true,
						},
						win = {
							input = {
								keys = {
									["<leader>f"] = "picker_files",
								},
							},
						},
					},
				},
				win = {
					-- input window
					input = {
						keys = {
							-- Custom
							["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
							["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
							["<c-w>"] = { "cycle_win", mode = { "i", "n" } },
							["<c-y>"] = { "put", mode = { "i", "n" } },
							["<c-Esc>"] = { "close", mode = { "n", "i" } },
							["<Esc><Esc>"] = { "close", mode = { "n" } },

							["<Down>"] = { "history_forward", mode = { "i", "n" } },
							["<Up>"] = { "history_back", mode = { "i", "n" } },

							["<c-o>"] = {
								"toggle_wrap",
								mode = { "i", "n" },
							},

							-- Default
							-- to close the picker on ESC instead of going to normal mode,
							-- add the following keymap to your config
							-- ["<Esc>"] = { "close", mode = { "n", "i" } },

							["/"] = false, -- "toggle_focus",
							["<C-Down>"] = false, -- { "history_forward", mode = { "i", "n" } },
							-- ["<C-Up>"] = { "history_back", mode = { "i", "n" } },

							["<C-c>"] = { "cancel", mode = "i" },
							-- ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },

							-- ["<CR>"] = { "confirm", mode = { "n", "i" } },

							["<Esc>"] = false, -- "cancel",

							-- ["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
							-- ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
							-- ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },

							-- overwritten in custom
							-- ["<Up>"] = false, -- { "list_up", mode = { "i", "n" } },
							-- ["<Down>"] = false, -- { "list_down", mode = { "i", "n" } },

							["<a-d>"] = false, -- { "inspect", mode = { "n", "i" } },
							["<a-f>"] = false, -- { "toggle_follow", mode = { "i", "n" } },
							["<a-h>"] = false, -- { "toggle_hidden", mode = { "i", "n" } },
							["<a-i>"] = false, -- { "toggle_ignored", mode = { "i", "n" } },
							["<a-m>"] = false, -- { "toggle_maximize", mode = { "i", "n" } },
							["<a-p>"] = false, -- { "toggle_preview", mode = { "i", "n" } },
							["<a-w>"] = false, -- { "cycle_win", mode = { "i", "n" } },

							-- ["<c-a>"] = { "select_all", mode = { "n", "i" } },
							-- ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
							-- ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
							-- ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
							-- ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },

							-- ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },

							-- ["<c-j>"] = { "list_down", mode = { "i", "n" } },
							-- ["<c-k>"] = { "list_up", mode = { "i", "n" } },
							-- ["<c-n>"] = { "list_down", mode = { "i", "n" } },
							-- ["<c-p>"] = { "list_up", mode = { "i", "n" } },

							-- ["<c-q>"] = { "qflist", mode = { "i", "n" } },

							-- ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
							-- ["<c-t>"] = { "tab", mode = { "n", "i" } },
							-- ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },

							-- ["<c-r>#"] = { "insert_alt", mode = "i" },
							-- ["<c-r>%"] = { "insert_filename", mode = "i" },

							-- ["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
							-- ["<c-r><c-f>"] = { "insert_file", mode = "i" },
							-- ["<c-r><c-l>"] = { "insert_line", mode = "i" },
							-- ["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
							-- ["<c-r><c-w>"] = { "insert_cword", mode = "i" },

							-- ["<c-w>H"] = false, -- "layout_left",
							-- ["<c-w>J"] = false, -- "layout_bottom",
							-- ["<c-w>K"] = false, -- "layout_top",
							-- ["<c-w>L"] = false, -- "layout_right",

							-- ["?"] = "toggle_help_input",

							-- ["G"] = "list_bottom",
							-- ["gg"] = "list_top",

							-- ["j"] = "list_down",
							-- ["k"] = "list_up",
							-- ["q"] = "close",
						},
						b = {
							minipairs_disable = true,
						},
					},
					-- result list window
					list = {
						keys = {
							-- Custom
							["<c-w>"] = "cycle_win",
							["<c-y>"] = "put",
							-- ["<c-e>"] = "inspect", used for debug if needed
							["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
							["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
							["<c-Esc>"] = "cancel",
							["<Esc><Esc>"] = "cancel",

							-- Default
							["/"] = false,

							-- ["<2-LeftMouse>"] = "confirm",
							-- ["<CR>"] = "confirm",
							-- ["<S-CR>"] = { { "pick_win", "jump" } },

							["<Esc>"] = false,

							-- ["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
							-- ["<Tab>"] = { "select_and_next", mode = { "n", "x" } },

							["<Up>"] = false, -- "list_up",
							["<Down>"] = false, -- "list_down",
							["<a-d>"] = false, -- "inspect",
							["<a-f>"] = false, -- "toggle_follow",
							["<a-h>"] = false, -- "toggle_hidden",
							["<a-i>"] = false, -- "toggle_ignored",
							["<a-m>"] = false, -- "toggle_maximize",
							["<a-p>"] = false, -- "toggle_preview",
							["<a-w>"] = false, -- "cycle_win",

							-- ["<c-a>"] = "select_all",
							-- ["<c-b>"] = "preview_scroll_up",
							-- ["<c-f>"] = "preview_scroll_down",
							-- ["<c-d>"] = "list_scroll_down",
							-- ["<c-u>"] = "list_scroll_up",

							-- ["<c-j>"] = "list_down",
							-- ["<c-k>"] = "list_up",
							-- ["<c-n>"] = "list_down",
							-- ["<c-p>"] = "list_up",

							-- ["<c-q>"] = "qflist",

							-- ["<c-s>"] = "edit_split",
							-- ["<c-t>"] = "tab",
							-- ["<c-v>"] = "edit_vsplit",

							["<c-w>H"] = false, -- "layout_left",
							["<c-w>J"] = false, -- "layout_bottom",
							["<c-w>K"] = false, -- "layout_top",
							["<c-w>L"] = false, -- "layout_right",

							-- ["?"] = "toggle_help_list",

							-- ["G"] = "list_bottom",
							-- ["gg"] = "list_top",

							-- ["i"] = "focus_input",

							-- ["j"] = "list_down",
							-- ["k"] = "list_up",

							-- ["q"] = "close",

							-- ["zb"] = "list_scroll_bottom",
							-- ["zt"] = "list_scroll_top",
							-- ["zz"] = "list_scroll_center",
						},
						wo = {
							conceallevel = 2,
							concealcursor = "nvc",
							wrap = false, -- enable line wrapping in the list window
						},
					},
					-- preview window
					preview = {
						keys = {
							-- Custom
							["<c-Esc>"] = "cancel",
							["<Esc><Esc>"] = "cancel",
							-- Default
							["<Esc>"] = false,
							-- ["q"] = "close",
							-- ["i"] = "focus_input",
							-- ["<c-w>"] = "cycle_win",
						},
					},
				},
				formatters = {
					file = {
						-- filename_first = true, -- display filename before the file path
						min_width = 999, -- don't truncate file names
					},
				},
			},
		},
		keys = {
			{
				"<leader>sP",
				function()
					require("snacks").picker.pickers()
				end,
				desc = "Snacks Pickers",
			},
		},
	},
}
