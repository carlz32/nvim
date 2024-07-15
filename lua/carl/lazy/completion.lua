return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "onsails/lspkind.nvim",
        },
        config = function()
            local luasnip = require "luasnip"
            local cmp = require "cmp"
            local lspkind = require "lspkind"
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {},
                mapping = cmp.mapping.preset.insert {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-i>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm {
                                    select = true,
                                }
                            end
                        else
                            fallback()
                        end
                    end),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        option = {
                            markdown_oxide = {
                                keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
                            },
                        },
                    },
                    { name = "luasnip" },
                    { name = "crates" },
                    { name = "path" },
                    { name = "lazydev", group_index = 0 },
                }, {
                    { name = "buffer", keyword_length = 5 },
                }),
                ---@diagnostic disable-next-line: missing-fields
                formatting = {
                    format = lspkind.cmp_format {
                        mode = "symbol_text",
                        ellipsis_char = "...",
                        menu = {
                            buffer = "[Buf]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snip]",
                            path = "[Path]",
                            crates = "[Crate]",
                            lazydev = "[Dev]",
                        },
                    },
                },
                experimental = {
                    ghost_text = true,
                    native_menu = false,
                },
            }
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip").filetype_extend("typescript", { "javascript" })
            require("luasnip").filetype_extend("javascript", { "html" })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
}
