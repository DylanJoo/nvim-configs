local augroup = vim.api.nvim_create_augroup('vimrc', { clear = true })

-- Auto-reload init.lua on save
vim.api.nvim_create_autocmd('BufWritePost', {
  group = augroup,
  pattern = 'init.lua',
  command = 'source <afile>',
})

-- Restore cursor to last position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Makefile: disable expandtab
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'make',
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- C/C++: cindent and comment format
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'c', 'cpp', 'cc' },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.comments = 'sr:/*,mb:*,el:*/,://'
    vim.opt_local.cinoptions = '>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30'
  end,
})

-- Filetype: SCSS / SASS
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.scss',
  command = 'set ft=scss.css',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.sass',
  command = 'set ft=sass.css',
})

-- Filetype: EJS -> HTML
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.ejs',
  command = 'set filetype=html',
})

-- Omni completion per filetype
-- Note: these will be superseded by LSP when you set it up
local omni_completions = {
  { pattern = { 'html', 'markdown' }, omnifunc = 'htmlcomplete#CompleteTags' },
  { pattern = 'javascript',           omnifunc = 'javascriptcomplete#CompleteJS' },
  { pattern = 'python',               omnifunc = 'pythoncomplete#Complete' },
  { pattern = 'xml',                  omnifunc = 'xmlcomplete#CompleteTags' },
  { pattern = 'css',                  omnifunc = 'csscomplete#CompleteCSS' },
  { pattern = 'c',                    omnifunc = 'ccomplete#Complete' },
  { pattern = 'java',                 omnifunc = 'javacomplete#Complete' },
}

for _, entry in ipairs(omni_completions) do
  vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    pattern = entry.pattern,
    callback = function()
      vim.opt_local.omnifunc = entry.omnifunc
    end,
  })
end

-- Fallback omnifunc if none set
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  callback = function()
    if vim.opt_local.omnifunc:get() == '' then
      vim.opt_local.omnifunc = 'syntaxcomplete#Complete'
    end
  end,
})
