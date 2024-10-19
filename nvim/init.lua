require("options")
require("keybinds")
require("config.whichkey")
require("config.lazy")
require("config.bufferline")
require("config.lualine")
require("config.nvim-tree-config")
require("config.telescope")
require("config.alpha")
require("config.treesitter")
require("config.lsp-config")
require("config.toggleterm")
require("config.autopair")
require("config.undotree")
require("config.linting")
require("config.mason")
require("config.project")

vim.diagnostic.config({ virtual_text = false })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

require('Comment').setup()

-- add custom keybinds to which-key.nvim
require("which-key").add(require("which-key-keybinds"))


-- setup nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
