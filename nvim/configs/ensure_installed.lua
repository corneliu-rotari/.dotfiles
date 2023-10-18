local ei = {
	mason = {
		ensure_installed = {
			"clangd",
			"black",
			"pyright",
			"clang-format",
			"stylua",
			"lua-language-server",
			"bash-language-server",
			"shfmt",
			"grammarly-languageserver",
			"prettier",
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
