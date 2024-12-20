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
    -- {
    --     "Exafunction/codeium.vim",
    --     event = "BufEnter",
    --     config = function()
    --         -- Change '<C-g>' here to any keycode you like.
    --         vim.keymap.set("i", "<C-g>", function()
    --             return vim.fn["codeium#Accept"]()
    --         end, { expr = true, silent = true })
    --         vim.keymap.set("i", "<c-;>", function()
    --             return vim.fn["codeium#CycleCompletions"](1)
    --         end, { expr = true, silent = true })
    --         vim.keymap.set("i", "<c-,>", function()
    --             return vim.fn["codeium#CycleCompletions"](-1)
    --         end, { expr = true, silent = true })
    --         vim.keymap.set("i", "<c-x>", function()
    --             return vim.fn["codeium#Clear"]()
    --         end, { expr = true, silent = true })
    --     end,
    -- },
    {
        "github/copilot.vim",
        event = "BufEnter",
        config = function()
            -- accept the next word of the current suggestion
            vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")
            -- accept the next line of the current suggestion
            vim.keymap.set("i", "<C-k>", "<Plug>(copilot-accept-line)")
            -- dismiss the current suggestion
            vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)")
            -- cycle to the next suggestion
            vim.keymap.set("i", "<C-;>", "<Plug>(copilot-next)")
            -- cycle to the previous suggestion
            vim.keymap.set("i", "<C-,>", "<Plug>(copilot-previous)")
            -- request a new suggestion
            vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-suggest)")
        end,
    },
}
