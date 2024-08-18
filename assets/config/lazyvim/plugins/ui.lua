return {
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                show_close_icon = false,
                mode = "tabs",
                left_mouse_command = false,
                right_mouse_command = false,
            },
        },
    },
    {
        "folke/noice.nvim",
        opts = {
            cmdline = {
                view = "cmdline",
            },
            views = {
                cmdline_popupmenu = {
                    relative = "editor",
                    position = {
                        row = "99%",
                        col = "5%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                        max_height = 15,
                    },
                    border = {
                        style = "none",
                        padding = { 0, 3 },
                    },
                    win_options = {
                        winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
                    },
                },
                hover = {
                    border = {
                        style = "single",
                    },
                },
                confirm = {
                    border = {
                        style = "single",
                    },
                },
                popup = {
                    border = {
                        style = "single",
                    },
                },
            },
        },
    },
    {
        "nvim-ualine/lualine.nvim",
        opts = function(_, opts)
            local section = opts.sections.lualine_c
            -- vim.notify(section, "debug")
            local ft = 0
            for i = 1, #section do -- #v is the size of v for lists.
                if section[i][1] == "filetype" then
                    ft = i
                    break
                end
            end
            opts.sections.lualine_c[ft]["icon_only"] = false
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
        opts = function()
            local logo = {
                [[ ]],
                [[ ]],
                [[  ███████████████████████████████████████████████████                                                     ███████████████████████████████████████████████████╗]],
                [[       ███████████████████████████████████████████████                    █         █                    ███████████████████████████████████████████████╔════╝]],
                [[            ███████████████████████████████████████████                   ██       ██                   ███████████████████████████████████████████╔════╝     ]],
                [[                █████████████████████████████████████████                 ███████████                 █████████████████████████████████████████╔═══╝          ]],
                [[                  ██████████████████████████████████████████              ███████████              ██████████████████████████████████████████╔═╝              ]],
                [[                     █████████████████████████████████████████████████████████████████████████████████████████████████████████████████████╔══╝                ]],
                [[                      ███████████████████████████████████████████████████████████████████████████████████████████████████████████████████╔╝                   ]],
                [[                       █████████████████████████████████████████████████████████████████████████████████████████████████████████████████╔╝                    ]],
                [[                        ███████████████████████████████████████████████████████████████████████████████████████████████████████████████╔╝                     ]],
                [[                         █████████████████████████████████████████████████████████████████████████████████████████████████████████████╔╝                      ]],
                [[                         █████████████████████████████████████████████████████████████████████████████████████████████████████████████║                       ]],
                [[                         █████████████████████████████████████████████████████████████████████████████████████████████████████████████╚╗                      ]],
                [[                        ███████████████████████████████████████████████████████████████████████████████████████████████████████████████║                      ]],
                [[                                                    ███████████████████████████████████████████████╔═══════════════════════════════════╝                      ]],
                [[                                                               █████████████████████████████████╔══╝                                                          ]],
                [[                                                                   █████████████████████████╔═══╝                                                             ]],
                [[                                                                       █████████████████╔═══╝                                                                 ]],
                [[                                                                         █████████████╔═╝                                                                     ]],
                [[                                                                           █████████╔═╝                                                                       ]],
                [[                                                                             █████╔═╝                                                                         ]],
                [[                                                                              ███╔╝                                                                           ]],
                [[                                                                               █═╝                                                                            ]],
                [[ ]],
                [[ ]],
            }

            local opts = {
                theme = "doom",
                hide = {
                    -- this is taken care of by lualine
                    -- enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                },
                config = {
                    header = logo,
                    -- stylua: ignore
                    center = {
                        { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
                        { action = 'lua LazyVim.pick("oldfiles")()', desc = " Recent Files", icon = " ", key = "r" },
                        { action = 'lua LazyVim.pick.config_files()()', desc = " Config", icon = " ", key = "c" },
                        { action = 'lua LazyVim.pick()({ cwd = "~/Baptcave/baptnix" })', desc = " Nixos Configuration", icon = " ", key = "N" },
                        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
                        { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return {
                            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
                        }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            -- open dashboard after closing lazy
            if vim.o.filetype == "lazy" then
                vim.api.nvim_create_autocmd("WinClosed", {
                    pattern = tostring(vim.api.nvim_get_current_win()),
                    once = true,
                    callback = function()
                        vim.schedule(function()
                            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                        end)
                    end,
                })
            end

            return opts
        end,
    },
}
