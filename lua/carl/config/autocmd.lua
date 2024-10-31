vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { timeout = 200 }
    end,
})

-- Disable the concealing in some file formats
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "json", "jsonc", "markdown" },
    callback = function()
        vim.wo.conceallevel = 0
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown" },
    callback = function()
        vim.wo.conceallevel = 2
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", {}),
    callback = function()
        local set = vim.opt_local

        set.number = false
        set.relativenumber = false
        set.scrolloff = 0
    end,
})
