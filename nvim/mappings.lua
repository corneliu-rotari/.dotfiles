local M = {

	ctrl = {
		n = {
			["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
			["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
			["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
			["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		},
	},

	lsp_cmd = {
		n = {
			["<leader>lf"] = {
				function()
					vim.lsp.buf.format({ async = true })
				end,
				"Format",
			},

			["<leader>lr"] = {
				function()
					require("nvchad.renamer").open()
				end,
				"LSP rename",
			},

			["<leader>lK"] = {
				function()
					vim.lsp.buf.hover()
				end,
				"LSP hover",
			},

			["<leader>lgi"] = {
				function()
					vim.lsp.buf.implementation()
				end,
				"LSP implementation",
			},

			["<leader>ls"] = {
				function()
					vim.lsp.buf.signature_help()
				end,
				"LSP signature help",
			},

			["<leader>lD"] = {
				function()
					vim.lsp.buf.type_definition()
				end,
				"LSP definition type",
			},

			["<leader>la"] = {
				function()
					vim.lsp.buf.code_action()
				end,
				"LSP code action/fix",
			},

			["<leader>lgr"] = {
				function()
					vim.lsp.buf.references()
				end,
				"LSP references",
			},

			["<leader>lx"] = {
				function()
					vim.diagnostic.open_float({ border = "rounded" })
				end,
				"Floating diagnostic",
			},
		},
	},

	mason = {
		n = {
			["<leader>mm"] = { "<cmd> Mason <CR>", "GUI" },
			["<leader>mi"] = { "<cmd> MasonInstallAll <CR>", "Install All" },
			["<leader>mu"] = { "<cmd> MasonUninstallAll <CR> ", "Uninstall All" },
		},
	},

	files = {
		n = {
			["<leader>fa"] = {
				"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
				"Find all files",
			},
			["<leader>fc"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
			["<leader>ff"] = { "<cmd> Telescope find_files follow=true no_ignore=true <CR>", "Find files" },
			["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Find help page" },
			["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find old files" },
			["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols<cr>", "Find Document Symbols" },
			["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Find words in files" },

			["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
		},
	},

	git = {
		n = {
			["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
			["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
		},
	},

	buffers = {
		n = {
			["<leader>bf"] = { "<cmd> Telescope buffers <CR>", "Find in buffers" },
			["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
			["<leader>bc"] = {
				function()
					require("nvchad.tabufline").close_buffer()
				end,
				"Close buffer",
			},
		},
	},

	term = {
		n = {
			["<leader>tp"] = { "<cmd> Telescope terms <CR>", "Pick hidden" },
			["<leader>th"] = {
				function()
					require("nvterm.terminal").toggle("horizontal")
				end,
				"New horizontal term",
			},

			["<leader>tv"] = {
				function()
					require("nvterm.terminal").toggle("vertical")
				end,
				"New vertical term",
			},
		},
	},

	nvchad = {
		n = {
			["<leader>nt"] = { "<cmd> Telescope themes <CR>", "Themes" },
			["<leader>nm"] = { "<cmd> NvCheatsheet <CR>", "Mappings" },
			["<leader>nk"] = {
				function()
					vim.cmd("WhichKey")
				end,
				"Which-key keymaps",
			},
		},
	},

	jump = {
		n = {
			["<leader>jD"] = {
				function()
					vim.lsp.buf.declaration()
				end,
				"Declaration",
			},

			["<leader>jd"] = {
				function()
					vim.lsp.buf.definition()
				end,
				"Definition",
			},
		},
	},

	disabled = {
		n = {
			["<leader>e"] = "",
			["<leader>fz"] = "",
			["<leader>n"] = "",
			["<leader>h"] = "",
			["<leader>v"] = "",
			["<leader>b"] = "",
			["<leader>x"] = "",
			["<leader>cm"] = "",
			["<leader>ca"] = "",
			["<leader>ch"] = "",
			["<leader>rn"] = "",
			["gd"] = "",
			["gD"] = "",
			["<leader>pt"] = "",
			["<leader>wk"] = "",
			["<leader>wK"] = "",
		},
	},
}
return M
