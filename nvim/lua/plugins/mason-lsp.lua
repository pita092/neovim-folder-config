return{
{
    "williamboman/mason.nvim",
	config = function()
	require("mason").setup()
	end
	},
	{
	"williamboman/mason-lspconfig.nvim",
		config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", }

			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependecies = {"williamboman/mason.nvim"},
		config = function()
		local nvim_lsp = require("lspconfig")
		local lspconfig = require("lspconfig")
	
		lspconfig.pylsp.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.csharp_ls.setup({
root_dir = nvim_lsp.util.root_pattern('.git');})

		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
		vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
					end
	}
}
