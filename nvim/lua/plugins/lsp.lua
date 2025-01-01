-- Return the LSP configuration and its dependencies
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip" },
    },
    config = function()
        -- LSP configuration using lsp-zero
        local lsp = require("lsp-zero").preset({
            name = "recommended",
            set_lsp_keymaps = true,
            manage_nvim_cmp = true,
            suggest_lsp_servers = true,
        })

        -- Mason setup
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "ts_ls", -- Use ts_ls for TypeScript
                "html", -- HTML LSP
                "cssls", -- CSS LSP
                "tailwindcss", -- Tailwind CSS LSP
                "svelte", -- Svelte LSP
                "lua_ls", -- Lua LSP
                "graphql", -- GraphQL LSP
                "emmet_ls", -- Emmet LSP
                "prismals", -- Prisma LSP
                "pyright", -- Python LSP 
            },
            automatic_installation = true,
        })

        -- Configure Lua language server for Neovim development
        lsp.nvim_workspace()

        -- Setup LSP
        lsp.setup()

        -- nvim-cmp configuration
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm with Enter
                ["<C-Space>"] = cmp.mapping.complete(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}

