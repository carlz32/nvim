return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Gitsigns Next hunk" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Gitsigns Prev hunk" })

                -- Actions
                map("v", "<leader>hs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Gitsigns Stage hunk" })

                map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns Undo Stage hunk" })

                map("v", "<leader>hr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Gitsigns Reset hunk" })

                map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns Preview hunk" })

                map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns Stage buffer" })
                map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns Reset buffer" })

                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end, { desc = "Gitsigns Blame line" })
                map("n", "<leader>hB", gs.toggle_current_line_blame, { desc = "Gitsigns Toggle Current Line Blame" })

                map("n", "<leader>hd", gs.diffthis, { desc = "Gitsigns Diff this" })
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end, { desc = "Gitsigns Diff this" })

                map("n", "<leader>he", gs.toggle_deleted, { desc = "Gitsigns Toggle Deleted" })

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns Select hunk" })
            end,
        })
    end,
}
