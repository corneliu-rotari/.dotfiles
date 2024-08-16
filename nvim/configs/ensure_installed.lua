local ei = {
	mason = {
		ensure_installed = {
      -- Formaters
			"black",                -- python
			"clang-format",         -- C/C++
			"stylua",               -- lua
			"shfmt",                -- bash
      "sqlfmt",               -- sql
			"prettier",             -- md

      -- LSP
			"clangd",               -- C/C++
			"lua-language-server",  -- lua
			"marksman",             -- markdown
			"pyright",              -- python
			"bash-language-server", -- bash
      "sqlls",                -- sql
      "rust-analyzer"
		},
	},
	treesitter = {
		ensure_installed = {
			"c",
      "rust",
      "python",
      "haskell",
      "java",
			"cpp",
			"vim",
			"vimdoc",
			"lua",
			"bash",
			"markdown",
			"markdown_inline",
      "sql",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
}
return ei
