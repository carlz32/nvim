return {
    {
        "ThePrimeagen/refactoring.nvim",
        event = "BufEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup {
                show_success_message = true,
            }
            vim.keymap.set({ "n", "x" }, "<leader>rr", function()
                require("refactoring").select_refactor {
                    show_success_message = true,
                }
            end, { desc = "Select Refactor" })
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>ud", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
        end,
    },
    {
        "echasnovski/mini.pairs",
        version = "*",
        config = function()
            require("mini.pairs").setup {
                mappings = {
                    ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][ \n)]" },
                    ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][ \n]]" },
                    ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][ \n}]" },
                },
            }
        end,
    },
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        version = "*",
        config = function()
            require("nvim-surround").setup {}
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
}
