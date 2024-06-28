-- Set leader to <Space>
vim.g.mapleader = " "

-- Write file leader binding
vim.keymap.set("n", "<Leader>w", ":write<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><S-w>", ":wq<CR>", { noremap = true, silent = true })

-- Quit file leader binding
vim.keymap.set("n", "<Leader>q", ":qall<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><S-q>", ":qall!<CR>", { noremap = true, silent = true })

-- Copy leader binding
vim.keymap.set("n", "<Leader>y", '"+y', { noremap = true, silent = true })

-- Select all leader binding
vim.keymap.set("n", "<Leader><S-a>", "ggVG", { noremap = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
