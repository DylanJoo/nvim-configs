-- Replaces: preservim/tagbar (ctags-based) → LSP + Treesitter powered
-- Toggle: <Right>  (mirrors your old TagBar binding)
return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<Right>", "<cmd>AerialToggle<cr>", desc = "Toggle outline (aerial)" },
  },
  opts = {
    autojump = true,       -- mirrors tagbar's autofocus
    layout = {
      default_direction = "right",
      placement = "edge",
      min_width = 60,
    },
  },
}
