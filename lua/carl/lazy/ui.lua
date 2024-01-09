return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
        transparent_background = true,
        show_end_of_buffer = false,
        },
        config = function()
          vim.cmd.colorscheme 'catppuccin'
        end
    },
}
