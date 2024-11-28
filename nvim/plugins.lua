local ei = require("custom.configs.ensure_installed")
local plugins = {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"NvChad/nvterm",
		opts = {
			terminals = {
				type_opts = {
					float = {
						relative = "editor",
						row = 0.05,
						col = 0.125,
						width = 0.75,
						height = 0.8,
						border = "single",
					},
				},
				behavior = {
					autoclose_on_quit = {
						enabled = true,
						confirm = true,
					},
				},
			},
		},
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
			wk.add({
        { "<leader>f", group = "File"},
        { "<leader>c", group = "Config"},
        { "<leader>cm", group = "Mason"},
        { "<leader>k", group = "Kraft"},
        { "<leader>kc", group = "Cargo"},
        { "<leader>t", group = "Terminal"},
        { "<leader>m", group = "Marks"},
        { "<leader>l", group = "LSP"},
        { "<leader>g", group = "Git"},
        { "<leader>j", group = "Jump"},
        { "<leader>b", group = "Buffer"},
        { "<leader>w", group = "Workspace"},
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
		"nvim-tree/nvim-tree.lua",
		opts = {
			view = {
				side = "right",
			},
		},
	},
  {
    "paretje/nvim-man"
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
