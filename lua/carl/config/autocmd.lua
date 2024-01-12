vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Disable the concealing in some file formats
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "json", "jsonc", "markdown" },
    callback = function()
        vim.wo.conceallevel = 2
    end,
})
