return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            show_end_of_buffer = false,
        },
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('todo-comments').setup({})
            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })

            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next error/warning todo comment" })

            vim.keymap.set("n", "<leader>tt", ":TodoTelescope keywords=TODO,BUG,FIX,NOTE,WARN,HACK,PERF,TEST<CR>", { desc = "Todo Telescope" })
            vim.keymap.set("n", "<leader>to", function()
                local path = vim.fn.getcwd()
                vim.cmd('TodoTrouble cwd=' .. path)
            end, { desc = "Todo Trouble" })
        end,
    },
}
