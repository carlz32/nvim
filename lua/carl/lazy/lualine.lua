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
                lualine_b = {
                    "branch"
                },
                lualine_c = { {
                    "buffers",
                    symbols = {
                        modified = ' ●',
                        alternate_file = '󰑆 ',
                        directory = ' ',
                    },
                } },
                lualine_x = {
                    "searchcount",
                    "diagnostics",
                    "diff",
                },
            },
        }
    end,
}
