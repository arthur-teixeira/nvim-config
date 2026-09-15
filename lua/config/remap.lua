vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "v", "i" }, "<Left>", "<nop>")
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<nop>")
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<nop>")
vim.keymap.set({ "n", "v", "i" }, "<Up>", "<nop>")

vim.keymap.set("n", "<leader>tw2", function()
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
end)

vim.keymap.set("n", "<leader>tw4", function()
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
end)

local opt = { buffer = bufnr, remap = false }
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, opt)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end, opt)
vim.keymap.set("n", "<leader>vws", function()
	vim.lsp.buf.workspace_symbol()
end, opt)
vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end, opt)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
end, opt)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
end, opt)
vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end, opt)
vim.keymap.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end, opt)
vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end, opt)
vim.keymap.set("n", "<C-h>", function()
	vim.lsp.buf.signature_help()
end, opt)
