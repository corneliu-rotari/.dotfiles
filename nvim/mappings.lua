local M = {}

M.tmux = {
	plugin = true,
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- find
		["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Find Document Symbols" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all files" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Find live grep" },
		["<leader>bf"] = { "<cmd> Telescope buffers <CR>", "Find in buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Find help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find old files" },
		["<leader>fc"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

		-- git
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

		-- pick a hidden term
		["<leader>tp"] = { "<cmd> Telescope terms <CR>", "Pick hidden" },

		-- theme switcher
		["<leader>nt"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

		["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
	},
}

M.buf = {
	n = {
		["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
		["<leader>bc"] = {
			function()
				require("nvchad.tabufline").close_buffer()
			end,
			"Close buffer",
		},
	},
}

M.disabled = {
	n = {
		["<leader>e"] = "",
		["<leader>fz"] = "",
		["<leader>n"] = "",
		["<leader>h"] = "",
		["<leader>v"] = "",
		["<leader>b"] = "",
		["<leader>x"] = "",
	},
}

M.nvterm = {
	plugin = true,
	n = {
		["<leader>th"] = {
			function()
				require("nvterm.terminal").new("horizontal")
			end,
			"New horizontal term",
		},

		["<leader>tv"] = {
			function()
				require("nvterm.terminal").new("vertical")
			end,
			"New vertical term",
		},
	},
}

return M
