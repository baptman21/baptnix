vim.cmd("setlocal cc=88 textwidth=87")
local opts = {
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                    lineLength = 88,
                },
            }
        }
    }
}
require("lvim.lsp.manager").setup("ruff_lsp", opts)
require("lvim.lsp.manager").setup("pyright", opts)
