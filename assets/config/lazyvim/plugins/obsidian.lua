return {

	{
		"obsidian-nvim/obsidian.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "mind",
					path = "~/Baptcave/mind",
				},
			},
			-- Either 'wiki' or 'markdown'.
			preferred_link_style = "wiki",

			disable_frontmatter = false,

			note_frontmatter_func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
					note:add_alias(note.title)
				end

				local out = { id = note.id }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,

			-- Optional, for templates (see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Using-templates)
			templates = {
				folder = "99-templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function.
				-- Functions are called with obsidian.TemplateContext objects as their sole parameter.
				-- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
				substitutions = {
					yesterday = function()
						return os.date("%Y-%m-%d", os.time() - 86400)
					end,
					tomorrow = function()
						return os.date("%Y-%m-%d", os.time() + 86400)
					end,
					clean_name = function(ctx)
						local id = ctx.partial_note.id
						local date = os.date("%Y-%m-%d-", os.time())
						local without_date = (string.sub(id, 0, #date) == date) and string.sub(id, #date + 1) or id
						local without_underscore = string.gsub(without_date, "_", " ")
						local out = string.gsub(without_underscore, "^%l", string.upper)
						return out
					end,
				},
			},

			picker = {
				-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
				name = "snacks.pick",
				note_mappings = {
					-- Create a new note from your query.
					new = "<C-x>",
					-- Insert a link to the selected note.
					insert_link = "<C-l>",
				},
				tag_mappings = {
					-- Add tag(s) to current note.
					tag_note = "<C-x>",
					-- Insert a tag at the current location.
					insert_tag = "<C-l>",
				},
			},

			backlinks = {
				parse_headers = true,
			},

			sort_by = "modified",
			sort_reversed = true,

			ui = {
				enable = false, -- set to false to disable all additional syntax features
			},

			-- See https://github.com/obsidian-nvim/obsidian.nvim/wiki/Notes-on-configuration#statusline-component
			statusline = {
				enabled = true,
				format = "{{properties}} properties {{backlinks}} backlinks {{words}} words {{chars}} chars",
			},
		},
	},
}
