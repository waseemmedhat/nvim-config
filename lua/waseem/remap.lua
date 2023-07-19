local conf_path  = '/home/waseem/.config/nvim/'
local init_path  = conf_path .. 'init.lua'
local remap_path = conf_path .. 'lua/waseem/remap.lua'
local opts_path  = conf_path .. 'lua/waseem/options.lua'
local r_path     = conf_path .. 'lua/waseem/r.lua'

-- From kickstart
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Config files ("vimrc") access
vim.keymap.set('n', '<leader>rci', function() vim.cmd.edit(init_path) end, { desc = 'Edit vim[r][c]: [i]nit.lua' })
vim.keymap.set('n', '<leader>rcm', function() vim.cmd.edit(remap_path) end, { desc = 'Edit vim[r][c]: re[m]ap.lua' })
vim.keymap.set('n', '<leader>rcr', function() vim.cmd.edit(r_path) end, { desc = 'Edit vim[r][c]: [r].lua' })
vim.keymap.set('n', '<leader>rco', function() vim.cmd.edit(opts_path) end, { desc = 'Edit vim[r][c]: [o]ptions.lua' })

-- Terminal abbreviations
local term_group = vim.api.nvim_create_augroup("TermGroup", { clear = true })
vim.api.nvim_create_autocmd("TermEnter", {
    group = term_group,
    callback = function()
        vim.keymap.set('t', ';pi', 'pnpm install', { buffer = true })
        vim.keymap.set('t', ';prd', 'pnpm run dev', { buffer = true })
        vim.keymap.set('t', ';prb', 'pnpm run build', { buffer = true })
        vim.keymap.set('t', ';gs', 'git status', { buffer = true })
        vim.keymap.set('t', ';gd', 'git diff', { buffer = true })
        vim.keymap.set('t', ';ga', 'git add .', { buffer = true })
        vim.keymap.set('t', ';gc', 'git commit -m ""<Left>', { buffer = true })
        vim.keymap.set('t', ';ap', 'sudo apt update', { buffer = true })
        vim.keymap.set('t', ';ag', 'sudo apt upgrade', { buffer = true })
    end
})

-- Misc rempas
vim.keymap.set('n', '<leader>wd', function() vim.cmd.cd("%:h") end,
    { desc = 'Set [w]orking [d]irectory to current file' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [k]eymaps' })
vim.keymap.set('n', '<C-s>', ':w<Enter>', { desc = 'Write/Save' })
vim.keymap.set('n', '<leader>vt', ':vsp<Enter>:term<Enter>', { desc = 'Start [Terminal] (in [V]ertical split)' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<Enter>a', { desc = 'Write/Save' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Back to Normal Mode' })
