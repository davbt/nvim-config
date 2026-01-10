local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
  defaults = {
    file_ignore_patterns = {"node_modules", ".git/"},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  }
}

-- Keymaps specific to Telescope
local builtin = require("telescope.builtin")
local map = vim.keymap.set

map('n', '<leader>fp', builtin.find_files, { desc = "Find files" })
map('n', '<leader>fg', builtin.live_grep, { desc = "Search in project" })
map('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = "Search in buffer" })
map('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Search symbols in file" })
map('n', '<leader>fc', builtin.commands, { desc = "Search commands" })

