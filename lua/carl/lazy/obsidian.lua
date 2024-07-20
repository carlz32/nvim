return {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/Notes/Vaults/Carl's Notes",
                overrides = {
                    notes_subdir = "00 Zettelkasten",
                },
            },
            {
                name = "no-vault",
                path = function()
                    return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
                overrides = {
                    notes_subdir = vim.NIL,
                    new_notes_location = "current_dir",
                    templates = {
                        folder = vim.NIL,
                    },
                    disable_frontmatter = true,
                },
            },
        },
        templates = {
            folder = "Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
        },
        new_notes_location = "notes_subdir",
        image_name_func = function()
            -- Prefix image names with timestamp.
            return string.format("%s-", os.time())
        end,
        attachments = {
            img_folder = "Assets/imgs",
        },
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.date "%y%m%d%H%M") .. "-" .. suffix
        end,
        note_frontmatter_func = function(note)
            -- This is equivalent to the default frontmatter function.
            local out = {
                id = note.id,
                desc = "Edit by Neovim",
                date = os.date "📅%Y %m %d 🕛%H : %M : %S",
                tags = note.tags,
            }
            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end
            return out
        end,
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            vim.fn.jobstart { "xdg-open", url }
        end,
    },
    config = function(_, opts)
        require("obsidian").setup(opts)
        vim.keymap.set("n", "gl", "<CMD>ObsidianFollowLink<CR>", { desc = "Obsidian Follow Link" })
        vim.keymap.set("n", "<leader>bn", "<CMD>ObsidianNew<CR>", { desc = "Obsidian New Note" })
        vim.keymap.set("n", "<leader>bq", "<CMD>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch" })
        vim.keymap.set("n", "<leader>bs", "<CMD>ObsidianSearch<CR>", { desc = "Obsidian Search" })
        vim.keymap.set("n", "<leader>bl", "<CMD>ObsidianLink<CR>", { desc = "Obsidian Link Exist Note" })
        vim.keymap.set("n", "<leader>be", "<CMD>ObsidianLinkNew<CR>", { desc = "Obsidian Link New Note" })
    end,
}
