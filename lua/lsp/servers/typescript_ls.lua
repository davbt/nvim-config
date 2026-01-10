local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
    cmd = { "/opt/homebrew/bin/typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = function()
        local util = require('lspconfig.util')
        return util.root_pattern("package.json", "tsconfig.json", ".git")(vim.fn.getcwd()) or vim.fn.getcwd()
    end,
    -- Optional: disable formatting if using Prettier
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
    end,
})

