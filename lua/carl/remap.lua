vim.g.mapleader = " "

-- Normal
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohl, { desc = "No Highlight" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Go to Explorer" })
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy Console" })

-- Smart movements
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Lines Up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Smart Join" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Centered C-u" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Centered C-d" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Centered Next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Centered Pre" })

-- Smart copy and paste
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Cut without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste without Yank" })

-- Better Indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- Window
vim.keymap.set("n", "<leader>-", ":split<CR>", { desc = "Split Window H" })
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>", { desc = "Split Window V" })
vim.keymap.set("n", "<leader>H", "<C-w>h", { desc = "Move Window Left" })
vim.keymap.set("n", "<leader>L", "<C-w>l", { desc = "Move Window Right" })
vim.keymap.set("n", "<leader>J", "<C-w>j", { desc = "Move Window Down" })
vim.keymap.set("n", "<leader>K", "<C-w>k", { desc = "Move Window Up" })
vim.keymap.set("n", "<C-w><left>", ":vertical resize -2<CR>", { desc = "Resize Window Left" })
vim.keymap.set("n", "<C-w><right>", ":vertical resize +2<CR>", { desc = "Resize Window Right" })
vim.keymap.set("n", "<C-w><up>", ":resize +2<CR>", { desc = "Resize Window Up" })
vim.keymap.set("n", "<C-w><down>", ":resize -2<CR>", { desc = "Resize Window Down" })

-- Diagnotic
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic Open float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic Goto prev" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic Goto next" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Set loclist" })
