local vim = vim

return {
	"nvim-neo-tree/neo-tree.nvim",

	opts = {
		window = {
			position = "left",
			width = 35,
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".DS_Store",
					"Thumbs.db",
					".git",
					".hg",
					".svn",
					".idea",
					".vscode",
					".cache",
					".sass-cache",
					".npm",
					".yarn",
					".pnp.*",
					".env",
					".env.local",
					".env.development",
					".env.production",
					".env.test",
					".env.staging",
					".env.example",
					".env.local.example",
					".env.development.example",
					".env.production.example",
					".env.test.example",
					".env.staging.example",
					"node_modules",
					"vendor",
					"dist",
					"build",
					"coverage",
					"logs",
					"tmp",
					"temp",
					"cache",
					".svelte-kit",
					".next",
					".nuxt",
					".astro",
					".parcel-cache",
					".vite",
					".gitignore",
				},
			},
		},
		default_component_configs = {
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				default = "",
			},
			name = {
				highlight = "NeoTreeFileName",
			},
		},
	},

	config = function(_, opts)
		require("neo-tree").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "neo-tree",
			callback = function()
				vim.opt_local.number = true
				vim.opt_local.relativenumber = true
			end,
		})
	end,

	init = function()
		local function set_hl()
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#4f4f4f", bg = "NONE" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f6c177", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#FFFFFF", bg = "#1C2526" })
			vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#E5E5E5", bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = "#FFD700", bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#E5E5E5", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#f6c177", bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		end

		set_hl()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = set_hl,
		})
	end,
}
