local configs = require("nvim-treesitter.configs")
configs.setup({
	-- Add a language of your choice
	ensure_installed = {
		"cpp",
		"python",
		"lua",
		"java",
		"rust",
		"go",
		"nu",
		"javascript",
		"latex",
		"haskell",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})
