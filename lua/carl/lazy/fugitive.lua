return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>hg", "<CMD>G<CR>", { desc = "Fugitive Git" })
        vim.keymap.set("n", "<leader>hl", "<CMD>G log<CR>", { desc = "Fugitive Git Log" })
        vim.keymap.set("n", "<leader>hf", "<CMD>G reflog<CR>", { desc = "Fugitive Git Reflog" })
        vim.keymap.set("n", "<leader>hr", ":G pull --rebase", { desc = "Fugitive Git Pull Rebase" })
        vim.keymap.set("n", "<leader>hp", ":G push -u origin", { desc = "Fugitive Git Push" })
    end,
}
