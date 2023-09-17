local o = vim.opt

o.colorcolumn = "120"
o.relativenumber = true
o.scrolloff = 40
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
