return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "SmiteshP/nvim-navic" },
  config = function()
    local navic = require("nvim-navic")
    require("lualine").setup({
      sections = {
	lualine_a = { 'mode' },
	lualine_b = { 'diagnostics', 'filename' },
	lualine_c = { { navic.get_location, cond = navic.is_available } },
	lualine_x = { 'filetype' },
	lualine_y = { 'progress' },
	lualine_z = { 'location' }
      },
    })
  end
}
