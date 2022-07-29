local colorscheme = "tokyonight"

vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

