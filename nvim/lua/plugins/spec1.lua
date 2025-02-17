return {
	-- NOTE:  keyboard shortcuts using space + key, shows uses and possible following keys.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
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

	-- NOTE: lunarvim color scheme based on TokyoNight, my personal fav scheme.
	{
		"lunarvim/lunar.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme lunar]])
		end,
	},

	-- NOTE: tabs in neovim for the different open buffers.
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- NOTE: status line at the bottom of the screen.
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- NOTE: fuzzy finder for neovim. Crazy powerful, and has integrations for a lot of plugins.
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- NOTE: dashboard for nvim.
	{
		"goolord/alpha-nvim",
		lazy = true,
	},

	-- NOTE: syntax highlighting using tree-sitter.
	{
		"nvim-treesitter/nvim-treesitter",
	},

	-- NOTE: autocompletion from snippets.
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},

	-- NOTE: Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	}, -- Required
	{ "rafamadriz/friendly-snippets" },

	-- NOTE: nvim-cmp source for neovim's built-in language server client.
	{ "hrsh7th/cmp-nvim-lsp" },

	-- NOTE: allows nvim-cmp to use the buffer (aka take into account what you already typed to suggest it again)
	{ "hrsh7th/cmp-buffer" },

	-- NOTE: allows nvim-cmp to help with suggesting paths.
	{ "hrsh7th/cmp-path" },

	-- NOTE: luasnip completion source for nvim-cmp.
	{ "saadparwaiz1/cmp_luasnip" },

	-- NOTE: nvim-cmp source for neovim Lua API.
	{ "hrsh7th/cmp-nvim-lua" },

	-- NOTE: allows nvim-cmp to autocomplete your nvim commands too.
	{ "hrsh7th/cmp-cmdline" },

	-- NOTE: sane defaults for the nvim lsp.
	{
		"neovim/nvim-lspconfig",
	},

	-- NOTE: configures LuaLS to recognize vim config variables.
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- NOTE: automatically inserts the corresponding closing character ( e.g. ")" when typing "(" ). Can do other great stuff, but for now I only use it for that.
	{
		"windwp/nvim-autopairs",
	},

	-- NOTE: Never lose your work because of a stupid undo + write again. saves your undo's as a tree so you can freely browse and access them.
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- NOTE: multiple cursor in nvim.
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},

	-- NOTE: Nicer UI for notifications, commands, password input, ...
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- NOTE: Really useful plugin, automatically comments one or multiple lines, using the correct characters depending on the language.
	{ "numToStr/Comment.nvim" },

	-- NOTE: Nicer linting, with the possibility of only displaying the message when you're on the error's line.
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
	},

	-- NOTE: Project management in nvim: detects project directories (for example containing a .git file). Integrates very well with Telescope.
	{ "ahmedkhalf/project.nvim" },

	-- NOTE: Recursively search a directory for a regex.
	{ "BurntSushi/ripgrep" },

	-- NOTE: Forgot to use sudo for a file for which you don't have write permissions? Suda allows you to type in your sudo password and edit it anyway.
	{ "lambdalisue/vim-suda" },

	-- NOTE: good little plugin for practicing basic navigation.
	{ "ThePrimeagen/vim-be-good" },

	-- NOTE: Helps integrate nvim into tmux.
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- NOTE: Vim syntax highlighting for .kbd files. I use kanata for a few remaps, so this comes handy every so often.
	{ "kmonad/kmonad-vim" },

    -- NOTE: substited this in the place of render-markdown, mostly because i like the style better
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},

	-- NOTE: I'm using it right now while writing this. Create and browse different comment tage: todo, note, hack... and highlights it accordingly.
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- NOTE: Create and edit obsidian notes in neovim. I love nvim, but markdown is much more readable in obsidian, and some things like pdf annotations
	-- just aren't possible without it.
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "cours",
					path = "~/Documents/cours",
				},
			},
		},
	},

	-- NOTE: Leetcode challenges built right into neovim, meaning you can use the editor you're actually used to, without all the tedious copy-pasting for tests
	-- and submitting
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {},
	},

	-- NOTE: Forces you to use nvim more efficiently if possible (disables arrow keys, suggests shorter versions for some motions)
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			disabled_keys = {
				-- enable arrow keys in insert mode so you can still move around.
				["<Left>"] = { "n", "v" },
				["<Right>"] = { "n", "v" },
				["<Up>"] = { "n", "v" },
				["<Down>"] = { "n", "v" },
			},
			restricted_keys = {
				-- disable the limit for successive direction key presses, cause sometimes i just don't know how low i wanna go.
				["h"] = {},
				["j"] = {},
				["k"] = {},
				["l"] = {},
			},
		},
	},

	-- NOTE: Really useful plugin. Wanna enclose a word or selection with parentheses, brackets, or anything else that requres closing ? Then you
	-- need this plugin.
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- NOTE: Interface with code formatters so you can have a shortcut to run your favorite formatter.
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- NOTE: lazygit integration for nvim, a great gui for git.
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>Lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	-- NOTE: diff view plugin for nvim, comparing with the latest modified file
	{ "sindrets/diffview.nvim" },

	-- NOTE: useful plugins for quickly bookmarking files
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		opts = {
			show_icons = true,
			leader_key = ";", -- Recommended to be a single key
			-- buffer_leader_key = "M", -- Per Buffer Mappings
			global_bookmarks = true, -- Allow the bookmarks to not be project-dependent
		},
	},

	-- NOTE: great clipboard manager for neovim
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},

	-- NOTE: gitsigns integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- TODO: Someday, maybe, find a good image viewing plugin that works in NixOS...

	-- NOTE: displays hex colors
	{ "norcalli/nvim-colorizer.lua" },

	-- NOTE: Really cool fule browser
	-- TODO: make better keybinds for navigation, the default ones are kinda hard to reach
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},

	-- NOTE: beautiful typing practice plugin in neovim
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {
			mode = "phrases",
			kblayout = "azerty",
		},
		cmd = { "Typr", "TyprStats" },
	},

	-- NOTE: Minimal keystroke display
	{
		"nvzone/showkeys",
		cmd = "ShowkeysToggle",
		opts = {
			winopts = {
				border = "rounded",
			},
		},
	},

    -- WARN: wanted to use this to develop the UI for my plugins, but there's no documentation yet :/
	--[[ {
		"nvzone/volt",
	}, ]]

    -- NOTE: AWESOME collection of plugins, echanovski is an insanely prolific dev
	{ "echasnovski/mini.nvim", version = "*" },

    -- NOTE: movement plugin
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "z<space>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },
}
