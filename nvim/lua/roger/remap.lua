vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move block of code around, really nice
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move half screen down/up centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search (next) centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nvim-tree open & close (toggles)
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)

-- show trouble at cursor
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

-- go.nvim: add tags & remove tags
vim.keymap.set("n", "<leader>1", vim.cmd.GoAddTag)
vim.keymap.set("n", "<leader>2", vim.cmd.GoRmTag)

-- go.nvim: iferr code block
vim.keymap.set("i", "iferr", vim.cmd.GoIfErr)

-- go.nvim: populate struct with fields
vim.keymap.set("i", "gfs", vim.cmd.GoFillStruct)

-- go.nvim: install binaries with :GoInstallBinaries
