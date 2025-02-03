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

lsp.lua_ls.setup {}

lsp.rust_analyzer.setup {}

lsp.gopls.setup {}

lsp.pyright.setup {}

-- TODO: For some reason, the LSP is running but doesn't do anything. I'll have to figure it out.
-- lsp.ts_ls.setup {}
