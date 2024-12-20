vim.g.mapleader = " "

-- Normal
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohl, { desc = "No Highlight" })
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy Console" })

-- Search
vim.keymap.set("n", "<leader>n", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Smart movements
vim.keymap.set("v", "J", "<CMD>m '>+1<CR>gv=gv", { desc = "Move Lines Down" })
vim.keymap.set("v", "K", "<CMD>m '<-2<CR>gv=gv", { desc = "Move Lines Up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Smart Join" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Centered Next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Centered Pre" })
vim.keymap.set("n", "gw", "*N", { desc = "Search Word" })

-- Buffer
vim.keymap.set("n", "<tab>", "<CMD>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })

-- Smart copy and paste
vim.keymap.set({ "n", "v" }, "x", "\"_x", { desc = "Cut without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"_dP", { desc = "Paste without Yank" })

-- Better Indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- Window
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window Prefix" })

-- Terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end, { desc = "Open Terminal Mode" })

-- Diagnostic
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic Open float" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Diagnostic Goto prev" })
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Diagnostic Goto next" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Set loclist" })
