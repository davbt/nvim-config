-- Add pre-downloaded parser directory
local parser_path = vim.fn.expand("~/.config/nvim-plugins/start/themes/catppuccin")
vim.opt.rtp:append(parser_path)

require("catppuccin").setup({
    flavour = "auto",
    background = { light = "latte", dark = "mocha" },
})

-- Apply the colorscheme
vim.cmd("colorscheme catppuccin")
