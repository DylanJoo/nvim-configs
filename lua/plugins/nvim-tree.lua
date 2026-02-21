-- Replaces: preservim/nerdtree
-- Toggle: <Left>  (mirrors your old NERDTree binding)
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<Left>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
  },
  opts = {
    view = {
      width = 30,
    },
    filters = {
      dotfiles = false,
    },
    -- Close tree when it's the last window (mirrors NERDTree autocmd)
    actions = {
      open_file = {
        quit_on_open = false,
      },
    },
  },
  init = function()
    -- Disable netrw so nvim-tree takes over
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
