-- Replaces: kien/ctrlp.vim
-- <leader>f  → find files (was ctrlp's default)
-- <leader>fg → live grep
-- <leader>fb → buffers (was ,b :ls<CR>:b<Space>)
-- <leader>fh → help tags
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>f",  "<cmd>Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "%.git/", "%.so", "%.class", "%.pyc" },
    },
  },
}
