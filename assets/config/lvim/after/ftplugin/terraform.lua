vim.cmd("setlocal shiftwidth=2 tabstop=2")

require("lvim.lsp.manager").setup("terraformls", {
    cmd = { "terraform-ls", "serve", "-log-file=/tmp/terraform-ls-{{pid}}.log" }
})
