return {
	"williamboman/mason.nvim",
	dependencies = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup()

		local mason_lspconfig = require 'mason-lspconfig'
		local servers = {
			solargraph = {},
			sumneko_lua = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}
		mason_lspconfig.setup {
			ensure_installed = vim.tbl_keys(servers),
		}

		mason_lspconfig.setup_handlers {
			function(server_name)
				require('lspconfig')[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name]
				}
			end,
		}
	end
}
