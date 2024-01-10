return {
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set(
                "n",
                "<leader>ff",
                ":Telescope find_files initial_mode=normal<CR>",
                { desc = "Telescope Find files" }
            )
            vim.keymap.set("n", "<leader>fl", ":Telescope live_grep<CR>", { desc = "Telescope Live Grep" })
            vim.keymap.set(
                "n",
                "<leader>fs",
                ":Telescope git_status initial_mode=normal<CR>",
                { desc = "Telescope Git Status" }
            )
            vim.keymap.set(
                "n",
                "<leader>fh",
                ":Telescope help_tags initial_mode=normal<CR>",
                { desc = "Telescope Help Tags" }
            )
            vim.keymap.set(
                "n",
                "<leader>fr",
                ":Telescope resume initial_mode=normal<CR>",
                { desc = "Telescope Resume" }
            )
            vim.keymap.set(
                "n",
                "<leader>fd",
                ":Telescope diagnostics initial_mode=normal<CR>",
                { desc = "Telescope Diagnostics" }
            )
            vim.keymap.set(
                "n",
                "<leader>ft",
                ":Telescope treesitter initial_mode=normal<CR>",
                { desc = "Telescope Treesitter" }
            )
            vim.keymap.set(
                "n",
                "<leader>fb",
                ":Telescope file_browser path=%:p:h select_buffer=true hidden=true initial_mode=normal<CR>",
                {
                    noremap = true,
                    desc = "Telescope File Browser",
                }
            )
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
