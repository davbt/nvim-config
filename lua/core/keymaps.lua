vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>")

local map = vim.keymap.set

-- map('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
-- map('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
-- map('n', '<leader>di', vim.lsp.buf.implementation, { desc = "Go to implementation" })
map('n', 'gr', function()
    if vim.bo.filetype == "cs" then
        require('omnisharp_extended').telescope_lsp_references()
    else
        vim.lsp.buf.references()
    end
end, { desc = "References" })

map('n', 'gD', function()
    if vim.bo.filetype == "cs" then
        require('omnisharp_extended').telescope_lsp_type_definition()
    else
        vim.lsp.buf.type_definition()
    end
end, { desc = "Type Definition" })

map('n', '<leader>di', function()
    if vim.bo.filetype == "cs" then
        require('omnisharp_extended').telescope_lsp_implementation()
    else
        vim.lsp.buf.implementation()
    end
end, { desc = "Implementation" })

map('n', '<leader>dt', vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map('n', 'gr', vim.lsp.buf.references, { desc = "List references" })
map('n', 'K', vim.lsp.buf.hover, { desc = "Hover info" })
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
