return {
	"folke/snacks.nvim",
	opts = {
		indent = { enabled = false },
		dashboard = {
			preset = {},
			sections = {
				{
					-- section = "header",
					-- vim.notify(`${section = "header"}`)
				},
				-- { section = "startup", gap = 1 }, -- Show plugin load stats
				{
					text = {
						-- { "Welcome Quynezz!", align = "center", hl = "SnacksDashboardDesc" },
					},
					gap = 1,
				},
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)
	end,
}
