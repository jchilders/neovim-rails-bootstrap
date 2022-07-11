local M = {}

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- autocmd BufWritePost * :execute "luafile %" | :execute "PackerSync"

function M.init()
  if not packer_plugins["plenary.nvim"].loaded then
    vim.cmd([[packadd plenary.nvim]])
  end
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  -- Ignore warning msg "The same file is required" sumneko gives for the below
  -- requires statement. It is needed for the cmp completion window to pop up.
  require("plugins.cmp.luasnip").init()

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

        -- set a name for each source
        vim_item.menu = ({
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          luasnip = "[LuaSnip]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = "menu,menuone,noselect,noinsert",
      keyword_length = 1,
    },
    mapping = {
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif check_back_space() then
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<s-tab>", true, true, true),
            "n",
            true
          )
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif packer_plugins["neogen"].loaded then
          local neogen = require("neogen")
          if neogen ~= nil and neogen.jumpable() then
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes(
                "<cmd>lua require('neogen').jump_next()<CR>",
                true,
                true,
                true
              ),
              "",
              true
            )
          end
        elseif check_back_space() then
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<tab>", true, true, true),
            "n",
            true
          )
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping(function(_)
        return vim.fn.pumvisible() == 1 and cmp.close() or cmp.complete()
      end),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    -- preselect = cmp.PreselectMode.Item,
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            -- use all open buffers
            return vim.api.nvim_list_bufs()
          end,
        }
      },
    },
  })

  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
