return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup {
                highlight = {
                    comments_only = false,
                },
            }
            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })

            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next error/warning todo comment" })

            vim.keymap.set(
                "n",
                "<leader>tl",
                "<CMD>TodoTelescope keywords=TODO,BUG,FIX,NOTE,WARN,HACK,PERF,TEST initial_mode=normal<CR>",
                { desc = "Todo Telescope" }
            )
            vim.keymap.set("n", "<leader>tb", "<CMD>Trouble todo focus=true<CR>", { desc = "Todo Trouble" })
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("Comment").setup {}
        end,
    },
}
