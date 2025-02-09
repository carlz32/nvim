-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

-- Normal
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohl, { desc = "No Highlight" })

-- Buffer
vim.keymap.set("n", "<tab>", "<CMD>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })

-- Smart copy and paste
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Cut without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without Yank" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste without Yank" })
