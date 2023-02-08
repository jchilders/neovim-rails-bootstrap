return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "p00f/nvim-ts-rainbow",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
  },
  config = function()
	  local parsers = require("nvim-treesitter.parsers")

		local disable_function = function(lang, bufnr)
      if not bufnr then
        bufnr = 0
      end

      if lang == "help" then
        return true
      end

      local line_count = vim.api.nvim_buf_line_count(bufnr)
      if line_count > 20000 or (line_count == 1 and lang == "json") then
        vim.g.matchup_matchparen_enabled = 0
        return true
      else
        return false
      end
    end

		require("nvim-treesitter.configs").setup({
			ensure_installed = { "bash", "git_rebase", "json", "lua", "ruby", "rust", "sql", "typescript", "vim" },
			highlight = {
				enable = true,
				-- the following is needed to fix matchit/% code block matching from breaking
				-- see: https://github.com/andymass/vim-matchup/issues/145#issuecomment-820007797
				-- additional_vim_regex_highlighting = true,
				-- or -- additional_vim_regex_highlighting = { ruby=true },
			},

			-- indents via treesitter currently borked. disabling for now. see:
			-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1136
			-- indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "<C-M>",
					node_decremental = "<S-C-M>",
					scope_incremental = "grm",
				},
			},

			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "bufwrite", "cursorhold" },
			},
			textobjects = {
				swap = {
					enable = true,
					swap_next = {
						["<leader>mj"] = { "@function.outer" },
					},
					swap_previous = {
						["<leader>mk"] = { "@function.outer" },
					},
				}
			},
			-- playground = { -- requires nightly build
			--   enable = true,
			--   disable = {},
			--   updatetime = 25, -- debounced time for highlighting nodes in the playground from source code
			--   persist_queries = false, -- whether the query persists across vim sessions
			--   keybindings = {
			--     toggle_query_editor = "o",
			--     toggle_hl_groups = "i",
			--     toggle_injected_languages = "t",
			--     toggle_anonymous_nodes = "a",
			--     toggle_language_display = "i",
			--     focus_language = "f",
			--     unfocus_language = "f",
			--     update = "r",
			--     goto_node = "<cr>",
			--     show_help = "?",
			--   },
			-- },
		})
	end
}
