return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {

                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "html", "json", "yaml", "markdown" },
                }),

                null_ls.builtins.code_actions.refactoring,
            },
        })
    end,
}
