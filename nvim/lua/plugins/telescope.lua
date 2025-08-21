local config = function()
    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top",
                preview_width = 0.6,
                width = 0.95,
                height = 0.85,
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
                previewer = true,
            },
            buffers = {
                theme = "dropdown",
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
        { "<leader>fk", ":Telescope keymaps<CR>",    desc = "Telescope keymaps",    noremap = true, silent = true },
        { "<leader>fh", ":Telescope help_tags<CR>",  desc = "Telescope help tags",  noremap = true, silent = true },
        { "<leader>fm", ":Telescope find_files<CR>", desc = "Telescope find files", noremap = true, silent = true },
        { "<leader>fa", ":Telescope builtin<CR>",    desc = "Telescope builtin",    noremap = true, silent = true },
        { "<leader>fl", ":Telescope live_grep<CR>",  desc = "Telescope live grep",  noremap = true, silent = true },
        { "<leader>fb", ":Telescope buffers<CR>",    desc = "Telescope buffers",    noremap = true, silent = true },
        { "<leader>fj", ":Telescope emoji<CR>",      desc = "Telescope emoji",      noremap = true, silent = true },
    },
}
