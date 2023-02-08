return {
  "andymass/vim-matchup",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local ts_config = require("nvim-treesitter.configs")
    ts_config.setup({
      matchup = {
	enable = true,
      }
    })
  end,
}
