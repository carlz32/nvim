return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope Find files" })
            vim.keymap.set(
                "n",
                "<leader>e",
                "<CMD>Telescope buffers initial_mode=normal<CR>",
                { desc = "Telescope Find Buffers" }
            )
            vim.keymap.set("n", "<leader>fl", "<CMD>Telescope live_grep<CR>", { desc = "Telescope Live Grep" })
            vim.keymap.set(
                "n",
                "<leader>fg",
                "<CMD>Telescope git_status initial_mode=normal<CR>",
                { desc = "Telescope Git Status" }
            )
            vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Telescope Help Tags" })
            vim.keymap.set(
                "n",
                "<leader>fr",
                "<CMD>Telescope resume initial_mode=normal<CR>",
                { desc = "Telescope Resume" }
            )
            vim.keymap.set(
                "n",
                "<leader>fd",
                "<CMD>Telescope diagnostics initial_mode=normal<CR>",
                { desc = "Telescope Diagnostics" }
            )
            vim.keymap.set(
                "n",
                "<leader>ft",
                "<CMD>Telescope treesitter initial_mode=normal<CR>",
                { desc = "Telescope Treesitter" }
            )
            vim.keymap.set(
                "n",
                "gs",
                "<CMD>Telescope lsp_document_symbols<CR>",
                { desc = "Telescope Document symbols" }
            )
            vim.keymap.set(
                "n",
                "gS",
                "<CMD>Telescope lsp_workspace_symbols<CR>",
                { desc = "Telescope Workspace symbols" }
            )
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        event = "VeryLazy",
        build = "make",
        config = function()
            require("telescope").load_extension "fzf"
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    },
                },
            }
            require("telescope").load_extension "ui-select"
        end,
    },
}
