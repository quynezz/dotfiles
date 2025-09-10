local keymap = vim.keymap

local opts = { noremap = true, silent = true }

local vim = vim

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- WINDOW MANAGEMENT
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comment
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Toggle the neo-tree
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Override "=G" to reformat based on filetype
vim.api.nvim_set_keymap("n", "=G", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- Remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {

	pattern = "*",
	callback = function()
		-- Save cursor position
		local cursor = vim.api.nvim_win_get_cursor(0)
		-- Remove trailing whitespace
		vim.cmd([[%s/\s\+$//e]])
		-- Restore cursor position

		vim.api.nvim_win_set_cursor(0, cursor)
	end,
})

-- Set up keymaps for the delete all the buffer except the current buffer command
vim.api.nvim_create_user_command("DeleteAllBuffersExceptCurrent", function()
	-- Get the current buffer number
	local current_buf = vim.api.nvim_get_current_buf()

	-- Get all buffer numbers
	local all_buffers = vim.api.nvim_list_bufs()
	-- Iterate through all buffers and delete them if they are not the current one
	for _, buf in ipairs(all_buffers) do
		if buf ~= current_buf then
			pcall(vim.api.nvim_buf_delete, buf, { force = true })
		end
	end
end, { desc = "Delete all buffers except the current one" })

-- Get FullPath command
vim.api.nvim_create_user_command("FullPath", function()
	local full_path = vim.fn.expand("%:p") -- Get full path of current file

	if full_path == "" then
		print("No file path available (e.g., new buffer)")

		return
	end
	vim.fn.setreg("+", full_path) -- Copy to system clipboard
	print("Full path copied to clipboard: " .. full_path)
end, { desc = "Copy full path of current file to clipboard" })

-- Other keymaps
keymap.set("n", "<leader>m", ":MarkdownPreview<CR>", opts)
