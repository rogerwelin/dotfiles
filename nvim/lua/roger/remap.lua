vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move block of code around, really nice
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half page move around
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- nvim-tree open & close
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>q", vim.cmd.NvimTreeClose)

-- show trouble at cursoir
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, opts)
