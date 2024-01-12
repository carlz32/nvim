return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>hg", ":G<CR>", { desc = 'Fugitive Git'})
        vim.keymap.set("n", "<leader>hl", ":G log<CR>", { desc = 'Fugitive Git Log'})
    end,
}
