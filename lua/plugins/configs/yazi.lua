local ok, yazi = pcall(require, "yazi")
if not ok then
    vim.notify("yazi.nvim not found", vim.log.levels.WARN)
    return
end

yazi.setup({
    open_for_directories = false,
})

local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Open in directory of current file
map("n", "<leader>-", function()
    yazi.yazi()
end, vim.tbl_extend("force", opts, { desc = "Open Yazi (file dir)" }))

-- Open in Neovim's cwd
map("n", "<leader>c-", function()
    yazi.yazi({ cwd = vim.fn.getcwd() })
end, vim.tbl_extend("force", opts, { desc = "Open Yazi (cwd)" }))

-- Toggle last Yazi session
map("n", "<leader>yj", function()
    yazi.toggle()
end, vim.tbl_extend("force", opts, { desc = "Toggle Yazi session" }))
