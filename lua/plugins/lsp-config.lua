return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ruff", "pyright",  "tsserver", "rust_analyzer", "ast_grep"}
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require('lspconfig')
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.ast_grep.setup({
                capabilities = capabilities,
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
