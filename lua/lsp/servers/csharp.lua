local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()

lspconfig.omnisharp.setup({
    cmd = { "dotnet", "/opt/omnisharp/OmniSharp.dll", "--languageserver", "--hostPID", tostring(pid) },
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
    },
})
