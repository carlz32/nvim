return {
    "b0o/incline.nvim",
    event = "BufEnter",
    priority = 1200,
    config = function()
        require("incline").setup()
    end,
}
