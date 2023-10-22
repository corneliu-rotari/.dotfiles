local ei = require("custom.configs.ensure_installed")
local plugins = {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{ -- WhichKey overrides
		"folke/which-key.nvim",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "whichkey")
			require("which-key").setup(opts)

			local wk = require("which-key")
			wk.register({
				["<leader>"] = {
					name = "Leader",
					f = { name = "File" },
					c = {
						name = "Config",
						n = { name = "NvChad" },
						m = { name = "Mason" },
					},
					t = { name = "Terminal" },
					m = { name = "Marks" },
					l = { name = "LSP" },
					g = { name = "Git" },
					j = { name = "Jump" },
					b = { name = "Buffer" },
					w = { name = "Workspace" },
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = ei.mason,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = ei.treesitter,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}

return plugins
