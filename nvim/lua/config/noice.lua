require("noice").setup({
	routes = {
		{
			view = "popup",
			filter = {
				cmdline = "^:!",
			},
		},
	},
})
