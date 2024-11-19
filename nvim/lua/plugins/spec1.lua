return {
  -- Which-key Extension
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "lunarvim/lunar.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme lunar]])
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "phaazon/hop.nvim",
    lazy = true,
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      {'nvim-lua/plenary.nvim'},
    }
  },
  {
    "goolord/alpha-nvim",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    "windwp/nvim-autopairs"
  },
  {
    "jiaoshijie/undotree",
    dependencies  = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mg979/vim-visual-multi",
    branch="master"
  },
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
  },
  {'numToStr/Comment.nvim'},
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile"
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    config = function()
        require('tiny-inline-diagnostic').setup()
    end
  },
  {"ahmedkhalf/project.nvim"},
  {"BurntSushi/ripgrep"},
  {"lambdalisue/vim-suda"},
  {"ThePrimeagen/vim-be-good"},
  {"christoomey/vim-tmux-navigator", lazy=false},
  {"kmonad/kmonad-vim"},
}
