return {
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
            vim.keymap.set({ "n", "x" }, "<leader>rr", function()
                require("refactoring").select_refactor()
            end, { desc = 'Select Refactor'})
        end,
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>ud', vim.cmd.UndotreeToggle, { desc = 'Toggle UndoTree'})
        end,
    },
}
