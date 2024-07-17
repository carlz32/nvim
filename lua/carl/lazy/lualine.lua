local function formatter()
    local result = require("conform").list_formatters(vim.fn.bufnr "%")[1]["name"]
    if formatter == nil then
        return "None"
    end
    return result
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                theme = "catppuccin",
            },
            extensions = {
                "fugitive",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", formatter, "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        }
    end,
}
