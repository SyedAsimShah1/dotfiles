-- [[ Basic Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Newline
vim.keymap.set("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')
-- vim.keymap.set("n", "<CR>", function()
-- 	-- if vim.fn.getwininfo(vim.fn.win_getid())[0]["quickfix"] == 1 then
-- 	-- 	return ""
-- 	-- end
-- 	return '@="m`o<C-V><Esc>``"<CR>'
-- end)

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable newline on enter for quick list",
	group = vim.api.nvim_create_augroup("kill-newline-mapping", { clear = false }),
	pattern = "qf",
	callback = function()
		vim.keymap.del("n", "<CR>")
	end,
})

vim.api.nvim_create_autocmd("WinEnter", {
	desc = "Disable newline on enter for quick list",
	group = vim.api.nvim_create_augroup("kill-newline-mapping", { clear = false }),
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "qf" then
			vim.keymap.del("n", "<CR>")
		end
	end,
})

vim.api.nvim_create_autocmd("Bufleave", {
	desc = "Disable newline on enter for quick list",
	group = vim.api.nvim_create_augroup("enable-newline-mapping", { clear = false }),
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "qf" then
			vim.keymap.set("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')
		end
	end,
})

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
