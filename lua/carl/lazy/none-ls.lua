return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,

                null_ls.builtins.formatting.eslint,
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.code_actions.eslint,

                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "html", "json", "yaml", "markdown" },
                }),

                null_ls.builtins.formatting.rustfmt,

                null_ls.builtins.diagnostics.ruff,
                null_ls.builtins.formatting.ruff,

                null_ls.builtins.code_actions.refactoring,

                null_ls.builtins.diagnostics.typos,
                null_ls.builtins.formatting.taplo,
            },
        })
    end,
}
