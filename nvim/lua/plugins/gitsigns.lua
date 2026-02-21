-- Replaces: airblade/vim-gitgutter
-- Shows git diff signs in the sign column (same as gitgutter)
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "+" },
      change       = { text = "~" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },
    -- Navigate hunks (mirrors gitgutter's ]c / [c)
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end
      map("n", "]c", gs.next_hunk, "Next git hunk")
      map("n", "[c", gs.prev_hunk, "Prev git hunk")
      map("n", "<leader>hp", gs.preview_hunk, "Preview git hunk")
      map("n", "<leader>hs", gs.stage_hunk,   "Stage git hunk")
      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
    end,
  },
}
