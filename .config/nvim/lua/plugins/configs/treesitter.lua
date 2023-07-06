local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"fish",
		"html",
		"javascript",
		"json",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"tsx",
		"typescript",
		"query",
		"yaml",
		"vim",
		"vimdoc",
	},
	-- ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		query = {
			"rainbow-parens",
			html = "rainbow-tags",
			latex = "rainbow-blocks",
		},
	},
	playground = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
