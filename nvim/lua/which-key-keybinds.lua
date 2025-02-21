return {
  { "<leader>f", group = "File Search" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Color scheme" },
  { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find text in all files" },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Browse Projects" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent Files"},

  { "<leader>s", group = "Search"},
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Browse Find Help"},
  { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Browse Man Pages"},
  { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Browse Registers"},
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Browse Keymaps"},
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Browse Commands"},
  { "<leader>sp", "<cmd>Telescope neoclip<cr>", desc = "Browse Registers for pasting"},

  {"<leader>;", "<cmd>Alpha<cr>", desc = "Dashboard"},

  {"<leader>l", group = "LSP"},
  {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  {"<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
  {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename File" },
  {"<leader>la", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  {"<leader>la", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  {"<leader>lf", "<cmd>Format<cr>", desc = "Format using conform.nvim"},

  { "<leader>w", proxy = "<c-w>", group = "Windows" }, -- proxy to window mappings

  {"<leader><Tab>", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle UndoTree"},

  { "<leader>b", group = "Buffers"},
  { "<leader>bk", "<cmd>bdelete<cr>", desc = "Kill Current Buffer"},

  {"<leader>o", group = "Obsidian"},
  {"<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image from clipboard"},

  {"<leader>e", "<cmd>Oil<cr>", desc = "Oil File Explorer"},
  {"<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree  Explorer (deprecated)"},

  {
    mode = { "n" },
    { "<leader>/", require("Comment.api").toggle.linewise.current, desc = "Comment Line" }, -- the easier one: normal mode, linewise comment

    {"<Esc>", "<cmd>nohlsearch<cr>", desc = "disable highlight for search"},
  },
  {
    mode = {"v"},
    { "<leader>/", function()
      local esc = vim.api.nvim_replace_termcodes(
        '<ESC>', true, false, true
      )
      vim.api.nvim_feedkeys('V', 'nx', false) -- switch to linewise visual mode to avoid commenting from the middle of the line and other similar bullshit
      vim.api.nvim_feedkeys(esc, 'nx', false) -- exit visual mode
      require("Comment.api").toggle.blockwise(vim.fn.visualmode()) -- call the blockwise comment toggle function, passing as argument the last visual mode buffer
    end,
    desc = "Comment Selection" }, -- Esoteric shit to make the blockwise comments not fucked up
    -- NOTE: Won't work if the language doesn't support blockwise comments (e.g. Python). I'll figure it out eventually.
  },

  {"<leader><Left>", function() vim.cmd("bprev") end, desc = "Previous Buffer"},
  {"<leader><Right>", function() vim.cmd("bnext") end, desc = "Next Buffer"},

  {"<leader>|", "<cmd>vsplit<cr>", desc = "Vertical Split"},
  {"<leader>-", "<cmd>split<cr>", desc = "Horizontal Split"},

  {"<leader>p", "<cmd>Lazy<cr>", desc = "Plugins"},

  {"<leader>w","<cmd>SudaWrite<cr>", desc = "Sudo Write because you're a dumbass who forgot to sudo nvim"},

  {"<leader>H", "<cmd>Hardtime toggle<cr>", desc = "Toggle hardtime.nvim"},

  {"<leader>g", group = "Git"},
  {"<leader>gl","<cmd>LazyGit<cr>", desc = "Open LazyGit (great git TUI)"},
  {"<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle git signs"},

  {"<leader>c", "<cmd>:e ~/.config/nvim/init.lua<cr>", desc = "Edit neovim configuration (use with caution)"},

  {"<leader>T", group="Typr"},
  {"<leader>Tt", "<cmd>Typr<cr>", desc = "Open Typr"},
  {"<leader>Td", "<cmd>TyprStats<cr>", desc = "Open Typr stats tab"},
}
