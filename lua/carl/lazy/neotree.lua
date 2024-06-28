return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup {
            window = {
                position = "right",
                mappings = {
                    ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
                },
                fuzzy_finder_mappings = {
                    ["<down>"] = "move_cursor_down",
                    ["<C-n>"] = "move_cursor_down",
                    ["<up>"] = "move_cursor_up",
                    ["<C-p>"] = "move_cursor_up",
                },
            },
        }
        vim.keymap.set("n", "<leader>fe", "<CMD>Neotree toggle<CR>", { desc = "Neotree Explorer" })
    end,
}
