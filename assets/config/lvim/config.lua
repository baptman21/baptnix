-------------------------------------------------------------------------------
--           \BBBBBBBBBBBBBBB&*      B   B      *&BBBBBBBBBBBBBBB/
--               \&BBBBBBBBBBBB&\___/BBBBB\___/&BBBBBBBBBBBB&/
--                 \%BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB%/
--                   \BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/
--                      *****\%BBBBBBBBBBBBBBBBB%/*****
--                             ...#BBBBBBBBB#...
--                                  \BBBBB/
--                                    \B/
--                                     B
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-----------------------------   General options   -----------------------------
-------------------------------------------------------------------------------

lvim.log.level = "warn"
lvim.format_on_save.enabled = true

vim.opt.autoread = true
vim.opt.autowriteall = true

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
vim.opt.spelllang = { "en" }

-------------------------------------------------------------------------------
------------------------------------   UI   -----------------------------------
-------------------------------------------------------------------------------

lvim.colorscheme = "onedark"

vim.opt.signcolumn = "auto"
-- disable gitsign column
lvim.builtin.gitsigns.opts.signcolumn = false

vim.opt.guifont = "Hack Nerd Font Mono:h17"

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

-------------------------------------------------------------------------------
--------------------------------   Mappings  ----------------------------------
-------------------------------------------------------------------------------

lvim.leader = ","

-- Quickfix
vim.opt.swb = "useopen,vsplit"
lvim.keys.normal_mode["<leader>cw"] = "<CMD>botright :cw<CR>"
lvim.keys.normal_mode["<leader>ccl"] = "<CMD>botright :ccl<CR>"

-- Map arrows to resize
lvim.keys.normal_mode["<Left>"] = "<CMD>vert:res -5<CR>"
lvim.keys.normal_mode["<Right>"] = "<CMD>vert:res +5<CR>"
lvim.keys.normal_mode["<Up>"] = "<CMD>res -5<CR>"
lvim.keys.normal_mode["<Down>"] = "<CMD>res +5<CR>"


-------------------------------------------------------------------------------
----------------------------   Builtin Plugins  -------------------------------
-------------------------------------------------------------------------------

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

-------------------------   Status line configuration -------------------------

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

-------------------------------  Dashboard  -----------------------------------
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.alpha.dashboard.section.buttons.entries[6] = {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit /home/baptman/Baptcave/baptnix/assets/config/lvim/config.lua <CR>" ..
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

-- Disable breadcrumbs
lvim.builtin.breadcrumbs.active = false

-- Better bufferline
lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.bufferline.options.mode = "tabs"

-- Enable terminal plufin
lvim.builtin.terminal.active = true

-- Enable cmp in cmd
lvim.builtin.cmp.cmdline.enable = true

-- Disable project plugin that auto cd in project
lvim.builtin.project.active = false

-- toggleterm plugin
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction = "horizontal"

-------------------------------  Nvimtree -------------------------------------

lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file = { enable = false, update_cwd = false }
lvim.builtin.nvimtree.setup.sync_root_with_cwd = false
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

---------------------------------  CMP ----------------------------------------

lvim.builtin.cmp.mapping["<C-K>"].i = function(fallback) fallback() end
lvim.builtin.cmp.mapping["<S-Tab>"].i = function(fallback) fallback() end
lvim.builtin.cmp.mapping["<S-Tab>"].s = function(fallback) fallback() end
lvim.builtin.cmp.mapping["<Tab>"].i = function(fallback) fallback() end
lvim.builtin.cmp.mapping["<Tab>"].s = function(fallback) fallback() end

------------------------------  Telescope -------------------------------------
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "possession")
    pcall(telescope.load_extension, "projects")
    pcall(telescope.load_extension, "notify")
    -- any other extensions loading
end

-------------------------------------------------------------------------------
-----------------------------   Extra Plugins  --------------------------------
-------------------------------------------------------------------------------

lvim.plugins = {
    -- Theme
    { "navarasu/onedark.nvim" },

    -- Better quickfix
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
    -- [] mappings
    {
        'tummetott/unimpaired.nvim',
        config = function()
            require('unimpaired').setup {
                -- add any options here or leave empty
            }
        end
    },

    -- Color highlight in files
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
    -- auto comments
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    -- lsp info
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup {
                window = { blend = 0, },
            }
        end
    },

    -- function signature
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
    -- Diagnostics display
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle"
    },
    -- Repeat more stuff
    { "tpope/vim-repeat" },
    -- Align magic
    { "junegunn/vim-easy-align" },
    -- Surround elements
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end,
    },
    -- gx (open url) sane
    { "felipec/vim-sanegx", event = "BufRead" },
    -- handling of sessions
    {
        'jedrzejboczar/possession.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    }
}


--------------------------------- Theme ---------------------------------------

require('onedark').setup {
    style = 'cool',
    transparent = true,
}
require('onedark').load()

-------------------------------- Trouble --------------------------------------

lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
}

-------------------------------- EasyAlign --------------------------------------

lvim.keys.normal_mode["<leader>ga"] = "<Plug>(EasyAlign)"
lvim.keys.visual_mode["<leader>ga"] = "<Plug>(EasyAlign)"

-------------------------------------------------------------------------------
---------------------------------   LSP   -------------------------------------
-------------------------------------------------------------------------------

---------------------------------- Format -------------------------------------

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", args = { "--line-length=120" }, },
    { command = "jq" },
}
----------------------------------- Lint --------------------------------------

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "mypy", args = { "--check-untyped-defs" }, },
}

----------------------------------- LSP ---------------------------------------

lvim.lsp.installer.setup.automatic_installation = { exclude = {} }

-- Disable nil_ls
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "nil_ls" })
-- Use rnix instead
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "rnix"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Disable pyright and pylyzer
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "pylyzer" })
-- Use ruff intead
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "ruff_lsp"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Needs manual setup now apparently
require("lvim.lsp.manager").setup("sumneko_lua", {})

-------------------------------------------------------------------------------
--------------------------------   Filetype   ---------------------------------
-------------------------------------------------------------------------------

vim.filetype.add({
    extension = {
        hcl = 'terraform',
        tf = 'terraform',
        mail = 'mail',
        mdx = 'markdown',
    },
})
