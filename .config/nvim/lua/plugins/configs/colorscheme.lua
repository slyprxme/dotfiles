require("onedarkpro").setup({
  colors = {
    onedark = {
      bg = "#23272E",
      -- bg = "#1E222A",
--       fg = "#C0CAF5",
--       yellow = "#FFE66D",
--       -- red = "#fb3f3e",
--       green = "#89ca78",
--       blue = "#61afef",
--       -- white = "#abb2bf",
--       black = "#282c34",
--       -- gray = "#5c6370",
--       -- highlight = "#e2be7d",
--       -- comment = "#7f848e",
    },
  },
  -- options = {
--     bold = true,                  -- Use bold styles?
--     italic = true,                -- Use italic styles?
--     underline = true,             -- Use underline styles?
--     undercurl = true,             -- Use undercurl styles?
--     cursorline = true,            -- Use cursorline highlighting?
    -- transparency = false,            -- Use a transparent background?
--     terminal_colors = true,       -- Use the theme's colors for Neovim's :terminal?
--     window_unfocused_color = false, -- When the window is out of focus, change the normal background?
  -- },
})
vim.cmd("colorscheme onedark")

-- require("nightfox").setup({
-- 	palettes = {
-- 		nordfox = {
-- 			bg1 = "#282c34",
-- 		},
-- 	},
-- })
-- --
-- vim.cmd("colorscheme nordfox")
