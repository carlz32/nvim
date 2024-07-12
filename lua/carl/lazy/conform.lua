return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { { "prettierd", "prettier" } },
                html = { { "prettierd", "prettier" } },
                markdown = { { "prettierd", "prettier" } },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        }
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
