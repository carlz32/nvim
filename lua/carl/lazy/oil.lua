return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory" })
    end,
}
