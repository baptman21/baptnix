local map = vim.keymap.set

-- Resize window arrow keys
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Obsidian shortcuts
map("n", "<leader>mb", "<cmd>Obsidian backlinks<cr>", { desc = "Obsidian backlinks" })
map("n", "<leader>mc", "<cmd>Obsidian toggle_checkbox<cr>", { desc = "Obsidian checkbox" })

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

map("n", "<leader>mmw", function()
	L.new_note("0-inbox/private-work/", "note")
end, { desc = "Create a new work note" })

map("n", "<leader>mmt", function()
	L.new_note("4-tasks/private-work/", "task")
end, { desc = "Create a new work task" })

map("n", "<leader>mmp", function()
	L.new_note("4-tasks/personal/", "task")
end, { desc = "Create a new personal task" })

-- Snacks image disable and enable
--
-- -- Disable snacks.image. First finds all existing autocmds from snacks.image,
-- then removes them and saves them to a global variable to re-enable later
L.disable_snacks_image = function()
	-- Some group names depend on image ID so we find them based on their events
	local events = {
		"BufWinEnter",
		"WinEnter",
		"BufWinLeave",
		"BufEnter",
		"WinClosed",
		"WinNew",
		"WinResized",
		"BufWritePost",
		"WinScrolled",
		"ModeChanged",
		"CursorMoved",
		"BufWipeout",
		"BufDelete",
		"BufWriteCmd",
		"FileType",
		"BufReadCmd",
	}
	local all_autocmds = vim.api.nvim_get_autocmds({ event = events })
	local image_autocmds = {}
	local group_set = {}
	for _, autocmd in ipairs(all_autocmds) do
		if autocmd.group_name ~= nil and string.find(autocmd.group_name, "snacks.image", 1, true) then
			image_autocmds[#image_autocmds + 1] = autocmd
			group_set[autocmd.group_name] = true
		end
	end
	-- Save autocmds and augroups for when it is time to re-enable
	_G.image_autocmds = image_autocmds
	_G.image_augroups = group_set
	-- Clean buffer and clear augroups
	Snacks.image.placement.clean()
	for group, _ in pairs(group_set) do
		vim.api.nvim_create_augroup(group, { clear = true })
	end
	-- Close hover if any
	Snacks.image.doc.hover_close()
	-- For toggle
	_G.snacks_disabled = true
end

-- Re-enable snacks.image after it was disabled
-- The function re-creates all autocmds and then re-attaches all buffers that were attached
L.enable_snacks_image = function()
	-- Re-create the groups
	for group, _ in pairs(image_augroups) do
		vim.api.nvim_create_augroup(group, { clear = true })
	end
	-- Re-create autocmds. Some keys need to be cleared or modified
	-- so that format from get_autocmds works with create_autocmd
	for _, autocmd in ipairs(image_autocmds) do
		autocmd.group = autocmd.group_name
		if autocmd.command == "" then
			autocmd.command = nil
		end
		autocmd.group_name = nil
		local event = autocmd.event
		autocmd.event = nil
		autocmd.id = nil
		if autocmd.buflocal then
			autocmd.pattern = nil
		end
		autocmd.buflocal = nil
		vim.api.nvim_create_autocmd(event, autocmd)
	end
	-- Loop over buffers and enable those with compatible filetype
	local bufs = vim.api.nvim_list_bufs()
	local langs = Snacks.image.langs()
	for _, buf in ipairs(bufs) do
		local ft = vim.bo[buf].filetype
		local lang = vim.treesitter.language.get_lang(ft)
		if vim.tbl_contains(langs, lang) then
			-- Make sure the buffer is detached otherwise attach does nothing
			vim.b[buf].snacks_image_attached = false
			Snacks.image.doc.attach(buf)
		end
	end
	_G.snacks_disabled = false
end

L.toggle_snacks_image = function()
	if snacks_disabled == nil then
		_G.snacks_disabled = false
	end
	if snacks_disabled then
		L.enable_snacks_image()
	else
		L.disable_snacks_image()
	end
end

map("n", "<leader>ti", function()
	L.toggle_snacks_image()
end, { desc = "Toggle Snack Image" })
