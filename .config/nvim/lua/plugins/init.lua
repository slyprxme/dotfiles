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
	{ "nvim-tree/nvim-web-devicons", lazy = true },

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
			-- cmd = { "LspInstall", "LspUninstall" },
			-- config = function()
			-- 	require("plugins.configs.lsp.mason-lsp")
			-- end,
			dependencies = "mason.nvim",
		},
		{
			"williamboman/mason.nvim",
			-- config = function()
			-- 	require("plugins.configs.lsp.mason")
			-- end,
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
			-- event = "InsertEnter",
			config = function()
				require("plugins.configs.cmp")
			end,

			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
		},
		{ "hrsh7th/cmp-nvim-lsp", lazy = true },
		{ "saadparwaiz1/cmp_luasnip", lazy = true },
		{ "hrsh7th/cmp-buffer", lazy = true },
		{ "hrsh7th/cmp-path", lazy = true },
		{
			"hrsh7th/cmp-cmdline",
			lazy = true,
		},
		{
			"L3MON4D3/LuaSnip",
		},
	},

	{ --------| treesitter & stuff |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins.configs.treesitter")
			end,
		},
		{ "windwp/nvim-ts-autotag", lazy = true },
		{ "HiPhish/nvim-ts-rainbow2", lazy = true },
		{ "nvim-treesitter/playground", lazy = true },
		{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
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

		{ --------| startup page with "alpha" |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"goolord/alpha-nvim",
			event = "VimEnter",
			config = function()
				require("plugins.configs.alpha")
			end,
		},

		{ --------| bufferline |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"akinsho/bufferline.nvim",
			version = "v3.*",
			event = "VeryLazy",
			config = function()
				require("plugins.configs.bufferline")
			end,
		},

		{ --------| File-Explorer |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"nvim-tree/nvim-tree.lua",
			config = function()
				require("plugins.configs.nvim-tree")
			end,
		},

		{ --------| Statusline |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
			config = function()
				require("plugins.configs.lualine")
			end,
		},

		{ --------| Line Indents and animation |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufReadPost", "BufNewFile" },
			opts = {
				-- char = "▏",
				char = "│",
				filetype_exclude = { "help", "alpha", "dashboard", "nvim-tree", "Trouble", "lazy" },
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
						pattern = { "help", "alpha", "dashboard", "nvim-tree", "Trouble", "lazy", "mason" },
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

		{ --------| Winbar(navigation) |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"SmiteshP/nvim-navic", -- need to attach it to buffer through on_attach function. (check later)
			lazy = true,
			config = function()
				require("plugins.configs.navic")
			end,
		},

		{ --------| more UI enhancements |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"stevearc/dressing.nvim",
			lazy = true,
		},

		{ --------| Notifications |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"rcarriga/nvim-notify", -- not working
			lazy = false,
			config = function()
				require("plugins.configs.notify")
			end,
		},
	},

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	{ --------< Editor Utilities >----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		{ --------| Telescope(fuzzy-finder) |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			version = false,
			config = function()
				require("plugins.configs.telescope")
			end,
		},

		{ --------| whichkey |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("plugins.configs.whichkey")
			end,
		},

		{ --------| Illuminate |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"RRethy/vim-illuminate",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("plugins.configs.illuminate")
			end,
		},

		{ --------| Project Management |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			"ahmedkhalf/project.nvim",
			evemt = "VimEnter",
			cmd = "Telescope projects",
			config = function()
				require("plugins.configs.project")
			end,
		},

		-- { --------| Diagnostics |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		-- 	"folke/trouble.nvim", -- check when working with large codebases and projects
		-- 	cmd = { "TroubleToggle", "Trouble" },
		-- },
	},
})
