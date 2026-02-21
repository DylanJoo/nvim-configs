-- Replaces: vim-airline/vim-airline
-- Mirrors your airline config: gruvbox theme, tabline with buffer numbers
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "gruvbox",
      icons_enabled = false,           -- no powerline/nerd fonts needed
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = { { "buffers", show_filename_only = true, show_bufnr = true } },
      lualine_z = { "tabs" },
    },
  },
}
