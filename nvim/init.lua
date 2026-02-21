vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")


-- Additional functions
local function nvim_tree_menu(node)
  local api = require("nvim-tree.api")
  local abs_path = node.absolute_path

  local menu_text = table.concat({
    "(a) Create",
    "(d) Delete",
    "(m) Move/Rename", 
    "(c) Copy",
  }, "\n")

  print(menu_text)

  local char = vim.fn.getcharstr()

  if char == "a" then
    api.fs.create()
  elseif char == "d" then
    api.fs.remove()
  elseif char == "m" then
    -- RENAME with full path pre-filled
    vim.ui.input({
      prompt = "Rename to: ",
      default = abs_path,
      completion = "file",
    }, function(new_path)
      if new_path and new_path ~= "" and new_path ~= abs_path then
        local ok, err = vim.loop.fs_rename(abs_path, new_path)
        if ok then
          api.tree.reload()
          vim.notify("Renamed to: " .. new_path, vim.log.levels.INFO)
        else
          vim.notify("Rename failed: " .. (err or "unknown error"), vim.log.levels.ERROR)
        end
      end
    end)
  elseif char == "c" then
    vim.ui.input({
      prompt = "Copy to: ",
      default = abs_path,
      completion = "file",
    }, function(dest_path)
      if dest_path and dest_path ~= "" then
        dest_path = vim.fn.expand(dest_path)
        -- If destination is an existing directory, append the source filename
        if vim.fn.isdirectory(dest_path) == 1 then
          dest_path = dest_path:gsub("/$", "") .. "/" .. vim.fn.fnamemodify(abs_path, ":t")
        end
        -- Ensure destination parent directory exists
        local dest_dir = vim.fn.fnamemodify(dest_path, ":h")
        if vim.fn.isdirectory(dest_dir) == 0 then
          vim.notify("Destination directory does not exist: " .. dest_dir, vim.log.levels.ERROR)
          return
        end
        -- Use system `cp -r` to support both files and directories
        local result = vim.fn.system({ "cp", "-r", abs_path, dest_path })
        if vim.v.shell_error == 0 then
          api.tree.reload()
          vim.notify("Copied to: " .. dest_path, vim.log.levels.INFO)
        else
          vim.notify("Copy failed: " .. result, vim.log.levels.ERROR)
        end
      end
    end)
  elseif char == "p" then
    api.fs.paste()
  end

  -- Clears the menu and prevents "Press ENTER"
  vim.cmd('redraw')
end
require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "m", function()
      local node = api.tree.get_node_under_cursor()
      nvim_tree_menu(node)
    end, opts("Show Menu"))
  end,
})

