return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            keymaps = {
                ["H"] = "actions.toggle_hidden",
            }
        })
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Oil: Open parent directory" })
    end,
}
