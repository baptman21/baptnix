vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Fix issue with blink.cmp autowrap
-- Cf. https://github.com/saghen/blink.cmp/issues/1445?reload=1
vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		local formatoptions = vim.opt.formatoptions:get()
		if formatoptions.t then
			vim.b.restore_formatoptions_t = true
			vim.opt.formatoptions:remove("t")
		end
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		if vim.b.restore_formatoptions_t then
			vim.opt.formatoptions:append("t")
			vim.b.restore_formatoptions_t = nil
		end
	end,
})
