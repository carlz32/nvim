vim.g.mapleader = " "

-- Normal
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohl, { desc = "No Highlight" })
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy Console" })

-- Smart movements
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Smart Join" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Centered Next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Centered Pre" })
vim.keymap.set("n", "gw", "*N", { desc = "Search Word" })

-- Buffer
vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", ":bprevious<CR>", { desc = "Previous Buffer" })

-- Smart copy and paste
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Cut without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste without Yank" })

-- Better Indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- Window
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window Prefix" })

-- Diagnostic
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic Open float" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Diagnostic Goto prev" })
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Diagnostic Goto next" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Set loclist" })
