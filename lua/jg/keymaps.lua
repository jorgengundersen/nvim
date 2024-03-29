-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- <Space> do nothing in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { desc = "<Space> do nothing in normal and visual mode", silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Copy/paste to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })

-- Copy current line and all lines below to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy current line and all lines below to system clipboard" })

vim.keymap.set("n", "<leader>yb", ":%y+<CR>", { desc = "[Y]ank [B]uffer to system clipboard" })

-- Delete selected text and place it in the default register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Format current buffer with language server
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Move selected line / block of text in visual mode up or down
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected line / block of text in visual block mode up" })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected line / block of text in visual block mode down" })
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected line / block of text in visual mode up" })
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected line / block of text in visual mode down" })


-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up", noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down", noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>",
	{ desc = "Resize window right", noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Decrease visual selection indent", noremap = true })
vim.keymap.set("v", ">", ">gv", { desc = "Increase visual selection indent", noremap = true })


-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)


-- Exit terminal mode with Esc
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal-mode', noremap = true, silent = true })

-- Close all buffers except buffer in focus
vim.api.nvim_set_keymap('n', '<leader>bc', [[:execute '%bd | edit# | bd#<CR>]],
	{ noremap = true, silent = true, desc = 'Close all buffers except buffer in focus' })

-- Open netrw
vim.keymap.set("n", "<leader>e", ":E<CR>", { desc = "Open netrw", noremap = true })
