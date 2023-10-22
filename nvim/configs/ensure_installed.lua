local ei = {
	mason = {
		ensure_installed = {
      -- Formaters
			"black",                -- python
			"clang-format",         -- C/C++
			"stylua",               -- lua
			"shfmt",                -- bash
			"prettier",             -- md

      -- LSP
			"clangd",               -- C/C++
			"lua-language-server",  -- lua
			"marksman",             -- markdown
			"pyright",              -- python
			"bash-language-server", -- bash
		},
	},
	treesitter = {
		ensure_installed = {
			"c",
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
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
}
return ei
