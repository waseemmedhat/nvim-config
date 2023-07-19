vim.o.hlsearch = false
vim.o.scrolloff = 0
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.wo.signcolumn = 'yes'
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

vim.o.mouse = ''

-- vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}


-- FROM KICKSTART --

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
-- vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

