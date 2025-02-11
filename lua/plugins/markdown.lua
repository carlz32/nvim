return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    opts = {
        heading = {
            sign = true,
            icons = { "󰼏 ", "󰎨 " },
        },
        checkbox = {
            enabled = true,
        },
    },
}
