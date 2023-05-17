local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",

	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	{ --------< LSP >----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		{ "jose-elias-alvarez/null-ls.nvim", lazy = true },
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = { "mason-lspconfig.nvim" },
			config = function()
				require("plugins.configs.lsp.init")
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = "mason.nvim",
		},
		{
			"williamboman/mason.nvim",
			cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
			build = function()
				pcall(function()
					require("mason-registry").refresh()
				end)
			end,
			-- lazy = true,
		},
	},

	{ --------< Auto-completion >----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		{
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins.configs.cmp")
			end,
		},
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{
			"hrsh7th/cmp-cmdline",
			-- lazy = true,
		},
		{ "rafamadriz/friendly-snippets" },
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},

	{ --------< treesitter & stuff >--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			version = nil,
			config = function()
				require("plugins.configs.treesitter")
			end,
		},
		{ "windwp/nvim-ts-autotag" },
		{ "HiPhish/nvim-ts-rainbow2", lazy = true },
		{ "nvim-treesitter/playground", lazy = true },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
	},

	{ --------< UI >----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		{ --------| colorschemes |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			{
				"olimorris/onedarkpro.nvim",
				config = function()
					require("plugins.configs.colorscheme")
				end,
			},
			{
				"folke/tokyonight.nvim",
			},
		},
		{
			--------| startup page with "alpha" |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"goolord/alpha-nvim",
			event = "VimEnter",
			config = function()
				require("plugins.configs.alpha")
			end,
		},
		{
			--------| bufferline |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"akinsho/bufferline.nvim",
			version = "v3.*",
			event = "VeryLazy",
			config = function()
				require("plugins.configs.bufferline")
			end,
		},
		{
			--------| File-Explorer |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			-- "nvim-tree/nvim-tree.lua",
			-- config = function()
			--   require("plugins.configs.nvim-tree")
			-- end,

			"nvim-neo-tree/neo-tree.nvim",
			config = function()
				require("plugins.configs.neotree")
			end,
		},
		{
			--------| Statusline |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
			config = function()
				require("plugins.configs.lualine")
			end,
		},
		{
			--------| Line Indents and animation |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufReadPost", "BufNewFile" },
			opts = {
				-- char = "▏",
				char = "│",
				filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
				show_trailing_blankline_indent = false,
				show_current_context = false,
			},

			{
				"echasnovski/mini.indentscope",
				version = false,
				event = { "BufReadPost", "BufNewFile" },
				opts = {
					draw = {
						delay = 100, -- (ms)
						-- animation =
						-- priority = 2   -- Symbol priority. Increase to display on top of more symbols.
					},
					-- symbol = "▏",
					symbol = "│",
					options = { try_as_border = true },
				},
				init = function()
					vim.api.nvim_create_autocmd("FileType", {
						pattern = {
							"help",
							"alpha",
							"dashboard",
							"neo-tree",
							"Trouble",
							"lazy",
							"mason",
							"NvimTreeToggle",
						},
						callback = function()
							vim.b.miniindentscope_disable = true
						end,
					})
				end,
				config = function(_, opts)
					require("mini.indentscope").setup(opts)
				end,
			},
		},
		{
			--------| Winbar(navigation) |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"SmiteshP/nvim-navic", -- need to attach it to buffer through on_attach function. (check later)
			lazy = true,
			config = function()
				require("plugins.configs.navic")
			end,
		},
		{
			--------| more UI enhancements |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			{
				"stevearc/dressing.nvim",
				config = function()
					require("plugins.configs.dressing")
				end,
			},

			{
				"MunifTanjim/nui.nvim",
				lazy = true,
			},

			{
				"folke/noice.nvim",
				config = function()
					require("plugins.configs.noice")
				end,
			},
		},
		{
			--------| Notifications |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"rcarriga/nvim-notify",
			lazy = false,
			config = function()
				require("plugins.configs.notify")
			end,
		},
	},

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	{ --------< Editor Utilities >----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		{
			--------| Telescope(fuzzy-finder) |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			version = false,
			config = function()
				require("plugins.configs.telescope")
			end,
		},
		{
			--------| whichkey |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("plugins.configs.whichkey")
			end,
		},
		{
			--------| Illuminate |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"RRethy/vim-illuminate",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("plugins.configs.illuminate")
			end,
		},
		{
			--------| Project Management |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"ahmedkhalf/project.nvim",
			evemt = "VimEnter",
			cmd = "Telescope projects",
			config = function()
				require("plugins.configs.project")
			end,
		},
		{
			--------| Highlight colors |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"NvChad/nvim-colorizer.lua",
			config = function()
				require("plugins.configs.colorize")
			end,
		},

		{
			--------| comments made easy |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"numToStr/Comment.nvim",
			config = function()
				require("plugins.configs.comment")
			end,
		},
		{
			--------| Autopairs |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.configs.autopairs")
			end,
		},
		{
			--------| terminal inside neovim |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins.configs.toggleterm")
			end,
		},
		{
			--------| Gitsigns |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins.configs.gitsigns")
			end,
		},

		-- { --------| Diagnostics |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		-- 	"folke/trouble.nvim", -- check when working with large codebases and projects
		-- 	cmd = { "TroubleToggle", "Trouble" },
		-- },
	},
})
