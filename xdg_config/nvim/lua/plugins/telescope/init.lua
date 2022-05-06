local M = {}
M.__index = M

function M.init()
  vim.cmd([[packadd plenary.nvim]])
  vim.cmd([[packadd telescope-project.nvim]])
  vim.cmd([[packadd telescope-fzf-native.nvim]])

  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local action_set = require("telescope.actions.set")

  telescope.setup({
    pickers = {
      find_files = {
        hidden = true,
        attach_mappings = function(_)
          action_set.select:enhance({
            post = function()
              vim.cmd(":normal! zx")
            end,
          })
          return true
        end,
      },
    },
    defaults = {
      previewer = false,
      prompt_prefix = "⦕ ",
      selection_caret = "⤜ ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      file_sorter = require("telescope.sorters").get_generic_sorter,
      file_ignore_patterns = { ".git/", "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      border = {},
      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "╭",
        "╮",
        "╯",
        "╰",
      },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      project = {
        base_dirs = {},
        max_depth = 4,
        hidden_files = true,
      },
    },
  })
  telescope.load_extension("fzf")
  telescope.load_extension("project")
  telescope.load_extension("dotfiles")
  telescope.load_extension("file_create")
end

return M