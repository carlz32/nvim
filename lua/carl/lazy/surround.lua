return {
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        version = "*",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
}
