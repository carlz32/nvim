return {
    {
        "williamboman/mason.nvim",
        opts = {
            pip = {
                upgrade_pip = true,
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "ts_ls",
                    "pyright",
                    "cssls",
                    "markdown_oxide",
                },
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
        },
        config = function()
            local lspconfig = require "lspconfig"
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.jsonls.setup {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas {
                            ignore = {
                                ".eslintrc",
                                "package.json",
                            },
                        },
                        validate = { enable = true },
                    },
                },
            }

            lspconfig.yamlls.setup {
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            }

            lspconfig.cssls.setup {
                capabilities = capabilities,
            }

            lspconfig.markdown_oxide.setup {
                capabilities = {
                    unpack(capabilities),
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            }

            lspconfig.html.setup {
                capabilities = capabilities,
            }

            lspconfig.lua_ls.setup {
                capabilities = capabilities,
            }

            lspconfig.ts_ls.setup {
                capabilities = capabilities,
            }

            lspconfig.pyright.setup {
                capabilities = capabilities,
            }

            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
            }

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
                    vim.keymap.set("n", "<leader>s", function()
                        vim.lsp.buf.format { async = true }
                    end, { buffer = ev.buf, desc = "LSP Format" })
                end,
            })
        end,
    },
}
