require("neodev").setup{}
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup {
	capabilities = capabilities
}

lspconfig.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	}
}

lspconfig.powershell_es.setup {
	capabilities = capabilities
}

lspconfig.marksman.setup {
	capabilities = capabilities
}

lspconfig.hls.setup {
	capabilities = capabilities
}
