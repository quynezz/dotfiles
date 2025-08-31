local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			layout_strategy = "horizontal", -- Default to horizontal split
			layout_config = {
				prompt_position = "top",
				width = 0.7,
				height = 0.7,
			},
			sorting_strategy = "ascending",
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				previewer = true,
				hidden = true,
			},
			live_grep = {
				prompt_position = "top",
				previewer = true,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.7,
					height = 0.6,
					preview_width = 0.4, -- Adjust preview width as needed
				},
			},
			buffers = {
				theme = "dropdown", -- Remove or replace with horizontal
				layout_strategy = "horizontal", -- Match live_grep layout
				layout_config = {
					prompt_position = "top",
					width = 0.7,
					height = 0.6,
					preview_width = 0.4, -- Preview on the right
				},
				previewer = true, -- Enable preview
			},
		},
	})

	telescope.load_extension("emoji")
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"xiyaowong/telescope-emoji.nvim",
	},
	config = config,
	keys = {
		{ "<leader>fk", ":Telescope keymaps<CR>", desc = "Telescope keymaps", noremap = true, silent = true },
		{ "<leader>fh", ":Telescope help_tags<CR>", desc = "Telescope help_tags", noremap = true, silent = true },
		{ "<leader>fm", ":Telescope find_files<CR>", desc = "Telescope find_files", noremap = true, silent = true },
		{ "<leader>fa", ":Telescope builtin<CR>", desc = "Telescope builtin", noremap = true, silent = true },
		{ "<leader>fl", ":Telescope live_grep<CR>", desc = "Telescope live_grep", noremap = true, silent = true },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Telescope buffers", noremap = true, silent = true },
		{ "<leader>fj", ":Telescope emoji<CR>", desc = "Telescope emoji", noremap = true, silent = true },
	},
}
