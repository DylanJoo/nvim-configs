local map = vim.keymap.set

-- Helper: replace current word in all open buffers
local function replace()
  local word = vim.fn.expand('<cword>')
  local replacement = vim.fn.input('Replace ' .. word .. ' with: ')
  if replacement ~= '' then
    vim.cmd('bufdo! %s/\\<' .. word .. '\\>/' .. replacement .. '/ge')
  end
end

-- Helper: insert C/C++ include guard
local function include_guard()
  local basename = vim.fn.substitute(vim.fn.bufname(''), '.*/', '', '')
  local guard = '_' .. vim.fn.substitute(vim.fn.toupper(basename), '\\.', '_', '') .. '_'
  vim.fn.append(0, '#ifndef ' .. guard)
  vim.fn.append(1, '#define ' .. guard)
  vim.fn.append(vim.fn.line('$'), '#endif // for #ifndef ' .. guard)
end

-- Leader
map('n', '<leader>r', replace, { desc = 'Replace word in all buffers' })

-- Quickfix
map('n', '<leader>cc', ':botright cope<CR>', { desc = 'Open quickfix' })
map('n', '<leader>]', ':cn<CR>', { desc = 'Next error' })
map('n', '<leader>[', ':cp<CR>', { desc = 'Prev error' })

-- Window navigation (move + maximize)
map('n', '<C-J>', '<C-W>j<C-W>_', { desc = 'Move to below split and maximize' })
map('n', '<C-K>', '<C-W>k<C-W>_', { desc = 'Move to above split and maximize' })
map('n', '<C-H>', '<C-W>h<C-W>|', { desc = 'Move to left split and maximize' })
map('n', '<C-L>', '<C-W>l<C-W>|', { desc = 'Move to right split and maximize' })

-- Tabs
map('n', '<C-t><C-t>', ':tabnew<CR>', { desc = 'New tab' })
map('n', '<C-t><C-w>', ':tabclose<CR>', { desc = 'Close tab' })

-- Buffers
map('n', 'gb', ':bnext<CR>', { desc = 'Next buffer' })
map('n', 'gB', ':bprevious<CR>', { desc = 'Prev buffer' })
map('n', 'XX', ':bdelete<CR>', { desc = 'Delete buffer' })
map('n', '<leader>b', ':ls<CR>:b<Space>', { desc = 'List and switch buffer' })

-- Search
map('n', '<leader>/', ':nohl<CR>', { desc = 'Clear search highlight' })

-- Paste mode
map('n', '<leader>p', ':set paste!<BAR>set paste?<CR>', { desc = 'Toggle paste mode' })

-- Visual indentation (stay in visual mode)
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Command-line bash-like bindings
map('c', '<C-A>', '<Home>')
map('c', '<C-E>', '<End>')
map('c', '<C-K>', '<C-U>')

-- Change working dir to current file's dir
map('c', 'cd.', 'lcd %:p:h')

-- Programming: include guard
map('n', '<leader>g', include_guard, { desc = 'Insert C/C++ include guard' })

-- RST headings
map('n', '<C-u>1', 'yyPVr#yyjp', { desc = 'RST Part heading (#)' })
map('i', '<C-u>1', '<esc>yyPVr#yyjpA', { desc = 'RST Part heading (#)' })
map('n', '<C-u>2', 'yyPVr*yyjp', { desc = 'RST Chapter heading (*)' })
map('i', '<C-u>2', '<esc>yyPVr*yyjpA', { desc = 'RST Chapter heading (*)' })
map('n', '<C-u>3', 'yypVr=', { desc = 'RST Section heading (=)' })
map('i', '<C-u>3', '<esc>yypVr=A', { desc = 'RST Section heading (=)' })
map('n', '<C-u>4', 'yypVr-', { desc = 'RST Subsection heading (-)' })
map('i', '<C-u>4', '<esc>yypVr-A', { desc = 'RST Subsection heading (-)' })
map('n', '<C-u>5', 'yypVr^', { desc = 'RST Subsubsection heading (^)' })
map('i', '<C-u>5', '<esc>yypVr^A', { desc = 'RST Subsubsection heading (^)' })

-- Plugin keymaps: defined inline in each plugin file
-- <Left>  → NvimTreeToggle  (nvim-tree.lua)
-- <Right> → AerialToggle    (aerial.lua)
-- <leader>f/fg/fb → Telescope (telescope.lua)
