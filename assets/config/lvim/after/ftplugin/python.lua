vim.cmd("setlocal cc=120 textwidth=119")
local opts = {
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                    lineLength = 120,
                },
            }
        }
    }
}
require("lvim.lsp.manager").setup("ruff_lsp", opts)
require("lvim.lsp.manager").setup("pyright", opts)
