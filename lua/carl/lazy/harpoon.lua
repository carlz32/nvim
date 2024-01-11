return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():append()
        end, { desc = 'Harpoon Append'})
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoon Quick Menu'})

        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():select(1)
        end, { desc = 'Harpoon Select 1'})
        vim.keymap.set("n", "<C-t>", function()
            harpoon:list():select(2)
        end, { desc = 'Harpoon Select 2'})
        vim.keymap.set("n", "<C-n>", function()
            harpoon:list():select(3)
        end, { desc = 'Harpoon Select 3'})
        vim.keymap.set("n", "<C-s>", function()
            harpoon:list():select(4)
        end, { desc = 'Harpoon Select 4'})
    end,
}
