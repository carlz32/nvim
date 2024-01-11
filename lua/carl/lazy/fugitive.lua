return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>hg", vim.cmd.Git, { desc = 'Fugitive Git'})
    end,
}
