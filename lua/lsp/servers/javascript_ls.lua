local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
    cmd = { "/opt/homebrew/bin/typescript-language-server", "--stdio" },
    filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
    },
    root_dir = function()
        local util = require('lspconfig.util')
        return util.root_pattern("package.json", "jsconfig.json", "tsconfig.json", ".git")(vim.fn.getcwd()) or vim.fn.getcwd()
    end,
    on_attach = function(client, bufnr)
        -- Disable formatting if using Prettier
        client.server_capabilities.documentFormattingProvider = false
    end,
})

