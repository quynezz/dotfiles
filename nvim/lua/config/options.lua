-- Set vim global variables and options
local vim = vim
-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "xclip",
	copy = {
		["+"] = "xclip -selection clipboard",
		["*"] = "xclip -selection clipboard",
	},
	paste = {
		["+"] = "xclip -selection clipboard -o",
		["*"] = "xclip -selection clipboard -o",
	},
	cache_enabled = 0,
}
-- In ~/.config/nvim/lua/config/options.lua or a similar file
vim.opt.list = false
-- Disable all the animations
vim.g.snacks_animate = false
-- Increase the scroll speed
vim.g.scroll_speed = 10
-- Disable the autoformatting
vim.g.autoformat = false
-- Disable Image Sixel
vim.g.disable_sixel = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- Change all the cursor line (visual, insert and normal) into "block"
vim.opt.guicursor = "n-v-c-i-ci-ve-r-cr-o:block"
-- Disable the swap file
vim.o.swapfile = false

