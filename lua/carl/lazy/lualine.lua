return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                theme = "catppuccin",
            },
            extensions = {
                "fugitive",
            },
            sections = {
                lualine_c = { "buffers" },
            },
            inactive_sections = {
                lualine_c = { "buffers" },
            },
        }
    end,
}
