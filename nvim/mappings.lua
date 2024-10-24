local M = {

	ctrl = {
		n = {
			["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
			["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
			["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
			["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		},
		i = {
			["<C-n>"] = {
				function()
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
						""
					)
				end,
				"Next elem",
			},
			["<C-p>"] = {
				function()
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				end,
				"Prev elem",
			},
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
				"Rename",
			},

			["<leader>lh"] = {
				function()
					vim.lsp.buf.hover()
				end,
				"Hover",
			},

			["<leader>li"] = {
				function()
					vim.lsp.buf.implementation()
				end,
				"Implementation",
			},

			["<leader>ls"] = {
				function()
					vim.lsp.buf.signature_help()
				end,
				"Signature help",
			},

			["<leader>lt"] = {
				function()
					vim.lsp.buf.type_definition()
				end,
				"Type definition",
			},

			["<leader>la"] = {
				function()
					vim.lsp.buf.code_action()
				end,
				"LSP code action/fix",
			},

			["<leader>lR"] = {
				function()
					vim.lsp.buf.references()
				end,
				"References",
			},

			["<leader>lx"] = {
				function()
					vim.diagnostic.open_float({ border = "rounded" })
				end,
				"Floating diagnostic",
			},
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
		},
	},
	marks = {
		n = {
			["<leader>ml"] = { "<cmd> Telescope marks <CR>", "List marks" },
		},
	},
	git = {
		n = {
			["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
			["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
			["<leader>gd"] = {
				function()
					require("gitsigns").toggle_deleted()
				end,
				"Toggle deleted",
			},
		},
	},
	buffers = {
		n = {
			["<leader>bf"] = { "<cmd> Telescope buffers <CR>", "Find in buffers" },
			["<leader>bb"] = { "<cmd> enew <CR>", "New buffer" },
			["<leader>bc"] = {
				function()
					require("nvchad.tabufline").close_buffer()
				end,
				"Close buffer",
			},

			["<leader>bn"] = {
				function()
					require("nvchad.tabufline").tabuflineNext()
				end,
				"Goto next buffer",
			},

			["<leader>bp"] = {
				function()
					require("nvchad.tabufline").tabuflinePrev()
				end,
				"Goto prev buffer",
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

	kraft = {
		n = {
			["<leader>kcr"] = { "<cmd>! cargo run<CR>", "Cargo run" },
			["<leader>kcc"] = { "<cmd>! cargo check<CR>", "Cargo check" },
			["<leader>kcb"] = { "<cmd>! cargo build<CR>", "Cargo build" },
			["<leader>kct"] = { "<cmd>! cargo test<CR>", "Cargo test" },
		},
	},

	config = {
		n = {
			["<leader>cmm"] = { "<cmd> Mason <CR>", "GUI" },
			["<leader>cmi"] = { "<cmd> MasonInstallAll <CR>", "Install All" },
			["<leader>cmu"] = { "<cmd> MasonUninstallAll <CR> ", "Uninstall All" },
			["<leader>ct"] = { "<cmd> Telescope themes <CR>", "Themes" },
			["<leader>cu"] = { "<cmd> NvChadUpdate <CR>", "Update" },
			["<leader>cp"] = { "<cmd> Lazy <CR>", "Plugins" },
			["<leader>ck"] = {
				function()
					vim.cmd("WhichKey")
				end,
				"Which-key keymaps",
			},
		},
	},

	jump = {
		n = {
			["<leader>jn"] = { "<C-I>", "Next jump" },
			["<leader>jd"] = { "<cmd> cle <CR>", "Delete jumps" },
			["<leader>jp"] = { "<C-O>", "Prev jump" },
			["<leader>jl"] = { "<cmd> Telescope jumplist <CR>", "List jumps" },
			["<leader>jc"] = {
				function()
					local ok, start = require("indent_blankline.utils").get_current_context(
						vim.g.indent_blankline_context_patterns,
						vim.g.indent_blankline_use_treesitter_scope
					)

					if ok then
						vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
						vim.cmd([[normal! _]])
					end
				end,
				"Current context",
			},
		},
	},

	disabled = {
		n = {
			["<leader>e"] = "",
			["<leader>ma"] = "",
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
			["<leader>pt"] = "",
			["<leader>wk"] = "",
			["<leader>wK"] = "",
			["<leader>D"] = "",
			["<leader>td"] = "",
			["]c"] = "",
			["[c"] = "",
			["<leader>rh"] = "",
			["<leader>ph"] = "",
			["<leader>cc"] = "",
			["<leader>q"] = "",
			["<leader>ra"] = "",
			["<leader>gt"] = "",
		},
		i = {
			["<C-p>"] = "",
			["<C-n>"] = "",
		},
	},
	learn = {
		v = {
			["<Up>"] = { ":noh <CR>", "Clear highlights" },
			["<Down>"] = { ":noh <CR>", "Clear highlights" },
			["<Left>"] = { ":noh <CR>", "Clear highlights" },
			["<Right>"] = { ":noh <CR>", "Clear highlights" },
		},
		n = {
			["<Up>"] = { ":noh <CR>", "Clear highlights" },
			["<Down>"] = { ":noh <CR>", "Clear highlights" },
			["<Left>"] = { ":noh <CR>", "Clear highlights" },
			["<Right>"] = { ":noh <CR>", "Clear highlights" },
		},
		i = {
			["<Up>"] = { ":noh <CR>", "Clear highlights" },
			["<Down>"] = { ":noh <CR>", "Clear highlights" },
			["<Left>"] = { ":noh <CR>", "Clear highlights" },
			["<Right>"] = { ":noh <CR>", "Clear highlights" },
		},
	},
}
return M
