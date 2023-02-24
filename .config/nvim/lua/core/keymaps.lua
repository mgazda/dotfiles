vim.g.mapleader = '\\'

local keymap = vim.keymap

-- general keymap

keymap.set('n', '<leader><space>', ':noh<CR>')

keymap.set('n', '<leader>w', ':setlocal wrap!<CR>')
keymap.set('n', '<leader>r', ':setlocal relativenumber!<CR>')

keymap.set('', '<C-h>', 'gT')
keymap.set('', '<C-l>', 'gt')



-----------------------
-- Plugins keybindings
-----------------------

-- Nvim Tree
keymap.set('n', '<leader>n', ':NvimTreeOpen<CR>')
keymap.set('n', '<leader>no', ':NvimTreeOpen<CR>')
keymap.set('n', '<leader>nc', ':NvimTreeClose<CR>')

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
