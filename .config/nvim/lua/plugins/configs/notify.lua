local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	stages = "fade_in_slide_out",
	fps = 30,
	level = 2,
	on_open = nil,
	on_close = nil,
	render = "default",
	timeout = 3000,
	background_colour = "#000000",
	minimum_width = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
})

vim.notify = notify

local notify_filter = vim.notify
notify = function(msg, ...)
	if msg:match("character_offset must be called") then
		return
	end

	notify_filter(msg, ...)
end
