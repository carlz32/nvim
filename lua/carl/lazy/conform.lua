return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        }
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
