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
      '--smart-case',
      '--no-ignore',
    },
  }
}

-- Keymaps specific to Telescope
local builtin = require("telescope.builtin")
local map = vim.keymap.set

map('n', '<leader>fp',
    function()
      builtin.find_files({
        no_ignore = true,
        path_display = {"truncate"},
      })
    end,
    { desc = "Find files" }
)
map('n', '<leader>fg',
    function()
      builtin.live_grep({
        path_display = {"truncate"},
      })
    end,
    { desc = "Search in project" }
)
-- map('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = "Search in buffer" })
map('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Search symbols in file" })
map('n', '<leader>fc', builtin.commands, { desc = "Search commands" })
map('n', '<leader>fm', "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })

