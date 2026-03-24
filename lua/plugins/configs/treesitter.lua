-- Disable online downloads for security
require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.install").disable = true

-- Add pre-downloaded parser directory
local parser_path = vim.fn.expand("~/.config/nvim-plugins/start/parsers")
vim.opt.rtp:append(parser_path)

require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "cpp", "python", "java", "c_sharp", "javascript", "typescript", "kotlin" },
    highlight = { enable = true },
    -- indent = { enable = true },
}

