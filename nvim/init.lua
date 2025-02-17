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
require("config.mini")
require("config.markview")
require("config.luasnip")



require("obsidian").setup(require("config.obsidian"))


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

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TermOpen",
  { callback =  function ()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end }
)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- Override any unwanted settings
        vim.opt.conceallevel = 2
    end,
})
