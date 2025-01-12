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
require("config.project")
require("config.cmp")
require("config.format")
require("config.tiny-inline-diagnostic")
require("config.obsidian")

-- set handler for displaying diagnostics
vim.diagnostic.config({ virtual_text = false })

-- custom icons for linting
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

-- setup comment.nvim
require("Comment").setup()

-- add custom keybinds to which-key.nvim
require("which-key").add(require("which-key-keybinds"))

-- setup nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.conceallevel = 2
vim.bo.softtabstop = 2

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- setup with some options
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
