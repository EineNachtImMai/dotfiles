local lsp = require("lspconfig")

lsp.nixd.setup({
	cmd = { "nixd" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
			},
		},
	},
})

lsp.lua_ls.setup({})

lsp.rust_analyzer.setup({})

lsp.gopls.setup({})

lsp.pyright.setup({})

-- TODO: For some reason, the LSP is running but doesn't do anything. I'll have to figure it out.
-- lsp.ts_ls.setup {}

-- An example nvim-lspconfig capabilities setting
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").markdown_oxide.setup({
	-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
	-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	}),
	on_attach = on_attach, -- configure your on attach config
})

-- lsp.haskell_ls.setup {}
