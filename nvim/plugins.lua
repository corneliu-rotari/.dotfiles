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
			"nvimtools/none-ls.nvim",
			config = function()
				require("custom.configs.none-ls")
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
    config = function ()
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_port = "7777"
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = { server = "http://localhost:7777" },
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 1,
      }
      
    end
	},
  {
    "jim-at-jibba/micropython.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
    ft = { "python" }
    -- config = function()
    --   require("micropython.nvim").initialise()
    -- end
  },
}

return plugins
