vim.g.mapleader = ' '

-- Normal
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit Insert Mode'})
vim.keymap.set('n', '<Esc>', vim.cmd.nohl, { desc = 'No Highlight'})
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Go to Explorer'})
vim.keymap.set('n', '<leader>l', vim.cmd.Lazy, { desc = 'Lazy Console'})

-- Smart movements
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move Lines Down'})
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move Lines Up'})
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Smart Join'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Centered C-u'})
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Centered C-d'})
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Centered Next'})
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Centered Pre'})

-- Smart copy and paste
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { desc = 'Cut without yank'})
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yank'})
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dp', { desc = 'Paste without yank'})

-- Better Indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
