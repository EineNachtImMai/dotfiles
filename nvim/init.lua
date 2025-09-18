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
-- require("config.project")
require("config.cmp")
require("config.format")
require("config.tiny-inline-diagnostic")
require("config.mini")
require("config.markview")
require("config.luasnip")
require("config.possession")
require("config.ufo")
-- require("config.obsidian")
require("config.languages")
require("config.noice")

-- NOTE: NEEDS to be after the other "require"
require("which-key-keybinds")

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

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
