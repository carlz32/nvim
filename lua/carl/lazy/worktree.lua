return {
    "ThePrimeagen/git-worktree.nvim",
    event = "BufEnter",
    config = function()
        require("telescope").load_extension("git_worktree")
        vim.keymap.set(
            "n",
            "<leader>ht",
            ":Telescope git_worktree git_worktrees initial_mode=normal<CR>",
            { desc = "Telescope Git Worktrees" }
        )
        vim.keymap.set(
            "n",
            "<leader>hT",
            ":Telescope git_worktree create_git_worktree initial_mode=normal<CR>",
            { desc = "Telescope Create Git Worktree" }
        )
        local Worktree = require("git-worktree")

        -- op = Operations.Switch, Operations.Create, Operations.Delete
        -- metadata = table of useful values (structure dependent on op)
        --      Switch
        --          path = path you switched to
        --          prev_path = previous worktree path
        --      Create
        --          path = path where worktree created
        --          branch = branch name
        --          upstream = upstream remote name
        --      Delete
        --          path = path where worktree deleted

        Worktree.on_tree_change(function(op, metadata)
            if op == Worktree.Operations.Switch then
                print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
            elseif op == Worktree.Operations.Create then
                print(
                    "Created new worktree:"
                        .. metadata.branch
                        .. " in path "
                        .. metadata.path
                        .. ", upstream is"
                        .. metadata.upstream
                )
            elseif op == Worktree.Operations.Delete then
                print("Delete worktree in" .. metadata.path)
            end
        end)
    end,
}
