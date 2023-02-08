return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  -- comment code using directions or blocks. example:
  -- gc2j - comment current line and 2 down
  -- V2jgc - visually select current line & 2 down, then comment
  -- gcaf - with `af` mapped to treesitter `@function.outer`, comment out current function
  use({
    "b3nj5m1n/kommentary",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      local konfig = require("kommentary.config")
      vim.keymap.set('i', '<C-k>', "<C-o><Plug>kommentary_line_default")

      konfig.configure_language("default", {
        use_consistent_indentation = true,
      })

      -- Always use single line comments for Lua
      konfig.configure_language("lua", {
        prefer_multi_line_comments = false,
        prefer_single_line_comments = true,
      })

      local filetypes = { "javascriptreact", "typescriptreact"}
      for _, filetype in pairs(filetypes) do
        konfig.configure_language(filetype, {
          single_line_comment_string = "auto",
          multi_line_comment_strings = "auto",
          hook_function = function()
            require("ts_context_commentstring.internal").update_commentstring()
          end,
        })
      end
    end,
  })

  -- ysw( - surround word with parens (`w` here is a text object)
  -- ds" - delete surrounding quotes
  -- cs"' - change surrounding double quotes with single quotes
  -- dsq - delete closest surrounding quote
  -- dss - delete closest surrounding whatever
  -- :h nvim-surround
  use({
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  })

  -- {{ LSP }}

  -- LSP/completion/snippet all in one
  -- <C-d> - go to next placeholder in snippet
  -- <C-b> - go to previous placeholder in snippet
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lua"},

      -- Snippets
      {"L3MON4D3/LuaSnip"},
      {"rafamadriz/friendly-snippets"},
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.setup_nvim_cmp({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp', keyword_length = 3 },
          { name = 'luasnip', keyword_length = 3 },
          {
            name = "buffer",
            sorting = {
              -- distance-based sorting
              comparators = {
                function(...)
                  local cmp_buffer = require('cmp_buffer')
                  return cmp_buffer:compare_locality(...)
                end,
              }
            },
            option = {
              -- get completion suggestions from all buffers, not just current one
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            }
          }
        },
      })

      lsp.setup() -- this needs to be last
    end
  })

end)
