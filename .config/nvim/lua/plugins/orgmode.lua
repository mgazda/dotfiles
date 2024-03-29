-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/2ndBrain/agenda/*'},
  org_default_notes_file = '~/2ndBrain/refile.org',

  org_hide_emphasis_markers = true,

  win_split_mode = 'vsplit',

  org_capture_templates = {
    d = {
      description = 'Daily log',
      template = '\n* %u Daily log\n** %^{Headline}%?',
    },
    l = {
      description = 'Log entry',
      template = '** %^{Headline}%?',
    },
  },
})

require'cmp'.setup({
  sources = {
    { name = 'orgmode' }
  }
})

vim.opt.conceallevel = 3
vim.opt.concealcursor = 'nc'
