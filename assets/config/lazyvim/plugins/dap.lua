return {
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			if vim.fn.has("win32") == 1 then
				require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
			else
				require("dap-python").setup("uv")
			end
		end,
	},
}
