local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	null_ls.builtins.completion.spell.with({
		filetypes = { "gitcommit", "markdown", "text", "asciidoc" },
	}),
	formatting.prettier,
	formatting.stylua,
	formatting.clang_format,
	formatting.shfmt,
	lint.shellcheck,
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_init = function(new_client, _)
		new_client.offset_encoding = "utf-16"
	end,
})
