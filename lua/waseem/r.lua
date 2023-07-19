-- R MAPPINGS --

local main_r_callback = function()
    -- Arrow and pipe operator remaps
    vim.keymap.set('i', "';", '<space><esc>gelcw<space><-', { buffer = true })
    vim.keymap.set('i', ";'", '<space><esc>gelcw<space>|>', { buffer = true })
end

local r_group = vim.api.nvim_create_augroup("RGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = r_group,
    pattern = { "*.r", "*.R" },
    callback = main_r_callback
})


-- GIT MAPPINGS --

local main_git_callback = function()
    vim.keymap.set('n', '<leader>gs', ":Git status<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gd', ":Git diff<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>ga', ":Git add .", { buffer = true })
    vim.keymap.set('n', '<leader>gc', ":Git commit", { buffer = true })
end

local git_group = vim.api.nvim_create_augroup("GitGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = git_group,
    callback = main_git_callback
})
