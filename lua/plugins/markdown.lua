return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    opts = {
        code = {
            sign = true,
            width = "block",
            right_pad = 1,
        },
        heading = {
            sign = true,
            icons = { "󰼏 ", "󰎨 ", "󰼑 ", "󰎲 ", "󰼓 ", "󰎴 " },
        },
        checkbox = {
            enabled = true,
        },
    },
}
