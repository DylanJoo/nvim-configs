-- General
vim.opt.history = 50
vim.opt.ruler = true
vim.opt.autoread = true
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Display
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.cursorline = false

-- Wild menu
vim.opt.wildmenu = true
vim.opt.wildignore = { '*.o', '*.class', '*.pyc', '*/tmp/*', '*.so', '*.swp', '*.zip' }

-- Indentation
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Files
vim.opt.backup = false

-- Bells
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Timing
vim.opt.timeoutlen = 500

-- Clipboard
vim.opt.clipboard = 'unnamed'
vim.g.clipboard = {
  name = 'pbcopy',
  copy  = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
  paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
  cache_enabled = 0,
}

-- Window sizing
vim.opt.laststatus = 2
vim.opt.winminwidth = 0
vim.opt.winminheight = 0

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = { 'ucs-bom', 'utf-8', 'big5', 'gb2312', 'latin1' }

-- Completion
vim.opt.completeopt:remove('preview')

-- ShaDa (replaces viminfo)
vim.opt.shada = "'10,\"100,:20,%"

-- Colorscheme: handled by lua/plugins/colorscheme.lua (ellisonleao/gruvbox.nvim)
vim.opt.background = 'dark'

-- Statusline: handled by lua/plugins/lualine.lua
