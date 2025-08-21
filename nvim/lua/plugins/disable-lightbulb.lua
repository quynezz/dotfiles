return {

	{
		"kosayoda/nvim-lightbulb",
		enabled = false,
	},

	{
		"LazyVim/LazyVim",
		opts = function(_, opts)
			opts.extras = opts.extras or {}
			opts.extras["lsp"] = false
			opts.extras["ui"] = false
			opts.lightbulb = false
			opts.code_action = {
				lightbulb = false,
			}
			return opts
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		opts = {
			lightbulb = {
				enable = false,
				sign = false,
				virtual_text = false,
			},
		},
	},
}
