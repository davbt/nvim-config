require("lsp.servers.pyright")
require("lsp.servers.clangd")
require("lsp.servers.csharp")
require("lsp.servers.lua_ls")
require("lsp.servers.marksman")
require("lsp.servers.typescript_ls")
require("lsp.servers.javascript_ls")

vim.diagnostic.config({
  virtual_text = false,   -- Disable inline diagnostics
  signs = true,           -- Show signs in gutter
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Show diagnostics in a floating window on CursorHold
vim.o.updatetime = 300
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

-- Keymaps for navigating diagnostics
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>', opts)
