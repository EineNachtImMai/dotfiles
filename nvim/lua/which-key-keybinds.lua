return {
  { "<leader>f", group = "File Search" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Color scheme" },
  { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find text in all files" },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Browse Projects" },
  { "<leader>fr", "<cmd>Telescope old_files<cr>", desc = "Open Recent Files"}, -- hide this keymap

  { "<leader>s", group = "Search"},
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Browse Find Help"},
  { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Browse Man Pages"},
  { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Browse Registers"},
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Browse Keymaps"},
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Browse Commands"},

  {"<leader>;", "<cmd>Alpha<cr>", desc = "Dashboard"},

  {"<leader>m", "<cmd>Mason<cr>", desc = "Mason (code completion) UI for LSP"},

  {"<leader>l", group = "LSP"},
  {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  {"<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
  {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename File" },
  {"<leader>la", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  {"<leader>la", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },

  { "<leader>w", proxy = "<c-w>", group = "Windows" }, -- proxy to window mappings

  { "<leader>t", group = "ToggleTerm" }, -- proxy to window mappings
  {"<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Toggle NodeJS Terminal"},
  {"<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Toggle Python Terminal"},
  -- {"<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Toggle NodeJS Terminal"},

  {"<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Toggle Horizontal Terminal"},
  {"<leader>tv", "<cmd>ToggleTerm size=30 direction=vertical<cr>", desc = "Toggle Vertical Terminal"},

  {"<leader><Tab>", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle UndoTree"},

  { "<leader>b", group = "Buffers"},
  { "<leader>bk", "<cmd>bdelete<cr>", desc = "Kill Current Buffer"},

  {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer"},
  {
    mode = { "n" },
    { "<leader>/", require("Comment.api").toggle.linewise.current, desc = "Comment Line" }, -- the easier one: normal mode, linewise comment
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
  },

  {"<leader><Left>", function() vim.cmd("bprev") end, desc = "Previous Buffer"},
  {"<leader><Right>", function() vim.cmd("bnext") end, desc = "Next Buffer"},

  {"<leader>|", "<cmd>vsplit<cr>", desc = "Vertical Split"},
  {"<leader>-", "<cmd>split<cr>", desc = "Horizontal Split"},

  {"<leader>o", "<cmd>on<cr>", desc = "Close All Windows Except Current"},
  {"<leader>p", "<cmd>Lazy<cr>", desc = "Plugins"},
  {"<leader>m", "<cmd>Mason<cr>", desc = "Mason"},

  {"<leader>w","<cmd>SudaWrite<cr>", desc = "Sudo Write because you're a dumbass who forgot to sudo nvim"}
}
