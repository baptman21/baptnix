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

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

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

vim.opt.backupdir = vim.fn.expand("$HOME/.local/share/nvim-lazyvim/tmp/backup")
vim.opt.undodir = vim.fn.expand("$HOME/.local/share/nvim-lazyvim/tmp/undo")
vim.opt.directory = vim.fn.expand("$HOME/.local/share/nvim-lazyvim/tmp/swap")

vim.opt.signcolumn = "auto" -- Always show the signcolumn, otherwise it would shift the text each time

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

vim.filetype.add({
	extension = {
		hcl = "terraform",
		tf = "terraform",
		tfvars = "terraform",
		mail = "mail",
		mdx = "markdown",
		gotmpl = "gotmpl",
	},
	filename = {
		["Chart.yaml"] = "yaml",
		["Chart.lock"] = "yaml",
	},
	pattern = {
		[".*/templates/.*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		[".*jsonnet.TEMPLATE"] = "jsonnet",
		["helmfile.*%.ya?ml"] = "helm",
	},
})

vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_python_lsp = "pyright"
