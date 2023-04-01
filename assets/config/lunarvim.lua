--- LVIM options ---

lvim.log.level = "warn"
lvim.colorscheme = "onedark"
lvim.format_on_save.enabled = true

-- Status bar configuration
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.component_separators = ""
lvim.builtin.lualine.sections = {
    lualine_a = { 'mode' },
    lualine_b = { components.branch, components.diff },
    lualine_c = { components.diagnostics, components.lsp, components.spaces, },
    lualine_x = { "searchcount" },
    lualine_y = { "filename", "fileformat", "filesize", components.filetype, },
    lualine_z = { components.location, components.progress }
}

-- UI
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.guifont = "Hack Nerd Font Mono:h17"
vim.opt.signcolumn = "auto"
vim.opt.updatetime = 100
vim.opt.title = false
vim.opt.cursorline = false
vim.opt.showcmd = true
vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.visualbell = true
vim.opt.belloff = "all"

vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.listchars = "tab:>-,nbsp:.,eol:$,trail:."
vim.opt.textwidth = 79

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 2
vim.opt.softtabstop = -1

-- Generated files
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.swapfile = true

vim.opt.backupdir = "/home/baptman/.local/share/lvim/tmp/backup"
vim.opt.undodir = "/home/baptman/.local/share/lvim/tmp/undo"
vim.opt.directory = "/home/baptman/.local/share/lvim/tmp/swap"

-- Misc
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autowrite = true
vim.opt.spelllang = { "en", "fr" }

-- Quickfix
vim.opt.swb = "useopen,vsplit"
lvim.keys.normal_mode["<leader>cw"] = "<CMD>botright :cw<CR>"
lvim.keys.normal_mode["<leader>ccl"] = "<CMD>botright :ccl<CR>"

-- Map arrows to resize
lvim.keys.insert_mode["<Left>"] = "<CMD>vert:res -5<CR>"
lvim.keys.normal_mode["<Left>"] = lvim.keys.insert_mode["<Left>"]
lvim.keys.insert_mode["<Right>"] = "<CMD>vert:res +5<CR>"
lvim.keys.normal_mode["<Right>"] = lvim.keys.insert_mode["<Right>"]
lvim.keys.insert_mode["<Up>"] = "<CMD>res -5<CR>"
lvim.keys.normal_mode["<Up>"] = lvim.keys.insert_mode["<Up>"]
lvim.keys.insert_mode["<Down>"] = "<CMD>res +5<CR>"
lvim.keys.normal_mode["<Down>"] = lvim.keys.insert_mode["<Down>"]

-- Specific languages
lvim.autocommands = {
    {
        "BufEnter",
        {
            pattern = { "*.py", "*.go" },
            command = "setlocal cc=120 textwidth=119",
        }
    },
}

--- Plugins ---

-- Builtins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- Use fugitive instead
lvim.builtin.gitsigns.active = false

lvim.builtin.alpha.dashboard.section.buttons.entries[6] = {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit /home/baptman/Baptcave/baptnix/assets/config/lunarvim.lua <CR>" ..
    "<CMD>cd /home/baptman/Baptcave/baptnix/ <CR>"
}


lvim.builtin.alpha.dashboard.section.buttons.entries[7] = {
    "x",
    "  Nixos Configuration",
    "<CMD>cd /home/baptman/Baptcave/baptnix/ <CR>" .. "<CMD>edit . <CR>"
}

lvim.builtin.alpha.dashboard.section.header.val = {
    [[⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀]],
    [[⠀⠀⠀⠀⠑⠒⢕⡜⣔⢎⢦⢣⢲⡱⡜⡔⣎⢦⢣⢲⡱⡜⡔⣎⢦⢣⢲⡱⡜⡔⣎⢦⢣⡪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⣔⢕⢆⢧⢲⢱⢢⡣⡲⡱⡢⣣⢲⢱⢢⡣⡲⡱⡢⣣⢲⢱⢢⡣⡲⡱⡢⠣⠒⠁⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠘⠸⢸⢪⡪⡣⡣⣣⢫⢪⡪⡪⡣⡣⣣⢫⢪⡪⡪⡣⡣⣣⢫⢪⡪⣪⢪⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⡂⠀⠀⠀⠀⢨⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⡱⡕⡵⡹⡸⡪⡪⡣⣣⢫⡪⡣⣣⢳⢹⢸⢜⢎⢇⢏⢎⡎⣇⢧⠳⠙⠈⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢕⢝⢼⢸⢪⢣⢣⡫⡪⣣⢣⢳⡱⡕⣝⢜⢕⢵⢱⢣⡣⣣⢳⢱⠥⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⡪⡎⡖⡕⣜⢜⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡔⡵⡱⡣⡳⡹⡸⡪⡣⡫⣪⢪⡪⡺⡸⡜⡎⡇⣇⢗⢕⡝⣜⢼⠸⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢕⢇⢗⢕⢇⢇⡏⣎⢎⢇⢇⡇⡧⡳⡹⡸⡪⡣⡣⣣⢳⢱⡹⡢⡣⡆⣆⢄⢄⢄⡀⡀⣀⢜⢜⢎⢞⢼⢸⢪⢲⢀⡀⣀⢠⢠⢠⢄⢆⡎⡮⡪⡺⡸⡪⡺⡸⡪⣪⢣⡫⡪⡪⡎⣎⢇⢧⢳⢹⢸⢸⢱⡱⡱⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⢱⡹⡸⡱⣱⢱⢕⢝⡜⡼⡸⡜⡎⡞⡜⡎⣇⠧⡳⡱⡱⡕⡇⡗⡕⡕⣇⢧⢣⢳⢱⡱⣹⢸⢱⡱⡕⡇⡗⣕⢵⢱⢕⢇⢗⢕⢇⢧⢳⢹⢸⡱⡹⡸⡱⡹⣸⢸⢜⢎⢇⢏⢎⢮⢪⢎⢞⢜⢕⢵⠱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢕⢕⡝⡼⡸⡜⡎⡇⣇⢗⢕⢵⢱⡹⡸⡪⣪⢺⢸⢪⢣⡣⡳⡹⡸⣱⢱⢕⢵⢹⡸⡜⣜⢜⢕⡕⡵⡱⣹⢸⡸⡜⡜⡎⡇⡗⡕⡇⡧⡳⡱⣱⢹⡸⡱⣹⢸⡸⡜⡎⣎⢧⢳⢱⢣⢳⡱⡹⡜⡕⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⡪⡪⡎⡮⡪⡎⡞⣜⢜⢕⡕⡇⡧⡫⡪⡎⣎⢇⢗⢕⢵⢹⢸⢪⡪⡎⡮⡪⡎⣎⢮⢪⡪⡣⣣⢳⢹⢸⡸⡸⡜⡎⡞⡜⡎⡇⡏⣎⢮⢺⢸⢜⢜⢎⢮⢪⡪⡪⡎⣎⢮⢪⢎⢇⢧⢣⢳⢱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣇⢗⢕⢇⢏⢮⢪⡪⡣⣣⢳⢱⡹⡸⡪⣪⢪⡣⡫⡪⡎⣇⢧⢣⡣⡳⡱⡹⡸⡸⡜⡜⣎⢮⢪⢎⢇⢇⢗⢕⢵⢹⡸⡪⡣⡫⡪⡪⡎⡮⡪⡣⡳⡱⡕⡕⡇⡏⣎⢎⢮⢪⢣⢳⢱⡹⡜⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⢭⢪⡪⡎⡇⡗⣕⢵⢱⡹⡸⡸⡱⡱⡹⡸⡜⣜⢜⢎⢇⢧⢣⡣⡇⡧⡫⡪⣣⢫⡪⡺⡸⡜⣜⢜⢎⢎⡇⣏⢮⢪⢣⡣⡳⡹⡸⡱⡕⡇⡗⡝⣜⢕⢵⢹⢸⡱⡹⡸⡸⡪⣪⢣⢳⡱⡕⡕⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠣⠣⠃⠃⠋⠊⠊⠊⠊⠊⠪⠣⠫⠪⢣⢳⢹⢸⢸⢪⢣⢳⢱⡱⡕⡵⡱⡝⣜⢜⡜⡎⡇⡧⡣⡳⡹⡸⡜⣜⢜⢎⢇⢇⢗⢝⢜⢕⢵⢱⢣⢫⢪⠪⠺⠸⠱⠑⠙⠘⠑⠙⠘⠘⠑⠑⠱⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠈⠑⠣⢣⡣⡇⡗⣕⢵⢱⢕⢕⢵⢹⢸⢪⢺⢸⡱⡕⣕⢕⢇⢗⢝⢜⠎⠇⠋⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠓⢕⢕⢵⢱⡹⡜⡎⡇⡗⡝⣜⢜⡜⡼⡸⡱⠑⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠱⡣⡣⡣⡇⡏⡮⡺⡸⡸⡜⠜⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠪⡣⡳⡹⡸⡜⡎⡇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡕⣝⢜⢼⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣜⢜⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]]
}

lvim.builtin.breadcrumbs.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.bufferline.options.mode = "tabs"

lvim.builtin.terminal.active = true

lvim.builtin.cmp.cmdline.enable = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "^.git$")
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "cache$")
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "__pycache__$")

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.matchup.enable = true

-- Extra plugins
lvim.plugins = {
    -- Theming
    { "navarasu/onedark.nvim" },

    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },

    -- Git
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },
    {
        'tummetott/unimpaired.nvim',
        config = function()
            require('unimpaired').setup {
                -- add any options here or leave empty
            }
        end
    },

    -- UI
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup {
                window = { blend = 0, },
            }
        end
    },

    -- Misc
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require "lsp_signature".on_attach({
                bind = true,
                handler_opts = { border = "rounded" }
            })
        end,
    },
    { "folke/trouble.nvim",   cmd = "TroubleToggle" },
    { "tpope/vim-repeat" },
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end,
    },
    { "felipec/vim-sanegx", event = "BufRead" },
    {
        'jedrzejboczar/possession.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
}

-- Onedark theming
require('onedark').setup {
    style = 'cool',
    transparent = true,
}
require('onedark').load()

-- Telescope settings
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "possession")
    pcall(telescope.load_extension, "projects")
    pcall(telescope.load_extension, "notify")
    -- any other extensions loading
end

--- Key Mappings ---

lvim.leader = ","

-- toggleterm plugin
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction = "horizontal"

-- Trouble plugin
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

--- Specific Linting/Formatting parameters ---
-- Formatter options
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", args = { "--line-length=120" }, },
    { command = "jq" },
}

-- Linter options
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "mypy", args = { "--check-untyped-defs" }, },
}

-- LSP options
lvim.lsp.automatic_servers_installation = true
-- Disable rnix/nil because rnix-lsp is installed with nix config, avoid
-- rebuild of rnix manually with cargo
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "nil_ls", "rnix" })
vim.list_extend(lvim.lsp.installer.setup.automatic_installation.exclude, { "rnix" })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lvim.lsp.manager").setup("clangd", { capabilities = capabilities })

require("lvim.lsp.manager").setup("rnix", { cmd = { "rnix-lsp" } })

vim.filetype.add({
    extension = {
        hcl = 'terraform',
    }
})
