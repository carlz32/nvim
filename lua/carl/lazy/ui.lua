return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                custom_highlights = function(colors)
                    local u = require("catppuccin.utils.colors")
                    return {
                        CursorColumn = {
                            bg = u.vary_color(
                                { latte = u.lighten(colors.mantle, 0.70, colors.base) },
                                u.darken(colors.surface0, 0.64, colors.base)
                            ),
                        },
                    }
                end,
                show_end_of_buffer = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    neotree = false,
                    harpoon = false,
                    treesitter = true,
                    mason = false,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    telescope = {
                        enabled = true,
                    },
                    lsp_trouble = false,
                    which_key = false,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({})
            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })

            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next error/warning todo comment" })

            vim.keymap.set(
                "n",
                "<leader>tl",
                ":TodoTelescope keywords=TODO,BUG,FIX,NOTE,WARN,HACK,PERF,TEST<CR>",
                { desc = "Todo Telescope" }
            )
            vim.keymap.set("n", "<leader>tb", function()
                local path = vim.fn.getcwd()
                vim.cmd("TodoTrouble cwd=" .. path)
            end, { desc = "Todo Trouble" })
        end,
    },
}
