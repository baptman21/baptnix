local map = vim.keymap.set

-- Resize window arrow keys
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Obsidian shortcuts
map("n", "<leader>mb", "<cmd>Obsidian backlinks<cr>", { desc = "Obsidian backlings" })
map("n", "<leader>mc", "<cmd>Obsidian toggle_checkbox<cr>", { desc = "Obsidian backlings" })

local L = {}

-- @param directory string
-- @param template string
function L.new_note(inbox, template)
	local date = os.date("%Y-%m-%d-", os.time())
	local path = vim.fn.expand("$HOME/Baptcave/mind/" .. inbox)

	require("snacks").input.input({}, function(name)
		if name:sub(-3) ~= ".md" then
			name = name .. ".md"
		end
		local full_path = path .. date .. name
		if vim.uv.fs_stat(full_path) then
			require("snacks").notify.error("File already exists: " .. full_path)
			return
		end
		vim.cmd("e " .. full_path)
		vim.cmd("Obsidian template " .. template)
	end)
end

map("n", "<leader>mmn", function()
	L.new_note("0-inbox/", "note")
end, { desc = "Create a new note" })

map("n", "<leader>mmt", function()
	L.new_note("4-tasks/work/", "task")
end, { desc = "Create a new work task" })

map("n", "<leader>mmp", function()
	L.new_note("4-tasks/personal/", "task")
end, { desc = "Create a new personal task" })
