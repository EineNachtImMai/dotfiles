local presets = require("markview.presets")

require("markview").setup({
	markdown = {
		headings = presets.headings.glow,
		tables = presets.rounded,
	},
})

vim.api.nvim_set_hl(0, "MarkviewPalette1", { fg = "#89dceb", bg = "#4A707B", bold = true })
vim.api.nvim_set_hl(0, "MarkviewPalette2", { fg = "#a6e3a1", bg = "#57735A", bold = true })
vim.api.nvim_set_hl(0, "MarkviewPalette3", { fg = "#fab387", bg = "#7E5D4E", bold = true })
vim.api.nvim_set_hl(0, "MarkviewPalette4", { fg = "#f38ba8", bg = "#7A4B5D", bold = true })
vim.api.nvim_set_hl(0, "MarkviewPalette5", { fg = "#cba6f7", bg = "#685781", bold = true })
vim.api.nvim_set_hl(0, "MarkviewPalette6", { fg = "#f2cdcd", bg = "#7A696E", bold = true })
