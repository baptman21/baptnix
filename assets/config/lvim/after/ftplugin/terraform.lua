require("lvim.lsp.manager").setup("terraformls", {
    cmd = { "terraform-ls", "serve", "-log-file=/tmp/terraform-ls-{{pid}}.log" }
})
