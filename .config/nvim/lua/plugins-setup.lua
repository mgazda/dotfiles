local Plug = vim.fn['plug#']
local path = vim.fn.stdpath('data') .. '/plugged'

vim.call('plug#begin', path)

-- LUA functions for other plugins
Plug 'nvim-lua/plenary.nvim'

-- Gruvbox color scheme
Plug 'morhetz/gruvbox'

-- Commenting with gc
Plug 'numToStr/Comment.nvim'

-- Add, delete, change surroundings
Plug 'tpope/vim-surround'

-- File explorer
Plug 'nvim-tree/nvim-tree.lua'

-- Tree sitter
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Fuzzy finder - Telescope
Plug ('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

-- Snippets engine
Plug 'L3MON4D3/LuaSnip'

-- Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'


-- Additional syntaxes
Plug 'vim-scripts/fish-syntax'

--Plug 'ixru/nvim-markdown'

Plug 'nvim-orgmode/orgmode'

vim.call('plug#end')
