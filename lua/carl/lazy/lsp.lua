return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "tsserver",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                    },
                },
            })

            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP Declaration" })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP Definition" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP Hover" })
                    vim.keymap.set(
                        "n",
                        "gi",
                        vim.lsp.buf.implementation,
                        { buffer = ev.buf, desc = "LSP Implementation" }
                    )
                    vim.keymap.set(
                        "n",
                        "<C-k>",
                        vim.lsp.buf.signature_help,
                        { buffer = ev.buf, desc = "LSP Signatrue Help" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>wa",
                        vim.lsp.buf.add_workspace_folder,
                        { buffer = ev.buf, desc = "LSP Add Workspace Folder" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>wr",
                        vim.lsp.buf.remove_workspace_folder,
                        { buffer = ev.buf, desc = "LSP Remove Workspace Folder" }
                    )
                    vim.keymap.set("n", "<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, { buffer = ev.buf, desc = "LSP List Workspace Folders" })
                    vim.keymap.set(
                        "n",
                        "<leader>D",
                        vim.lsp.buf.type_definition,
                        { buffer = ev.buf, desc = "LSP Type Definition" }
                    )
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP Rename" })
                    vim.keymap.set(
                        { "n", "v" },
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf, desc = "LSP Code Action" }
                    )
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "LSP References" })
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, { buffer = ev.buf, desc = "LSP Formate" })
                end,
            })
        end,
    },
}
