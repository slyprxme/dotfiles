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
		"query",
		"tsx",
		"typescript",
		"yaml",
	},
	-- ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true,
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
		enable = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
