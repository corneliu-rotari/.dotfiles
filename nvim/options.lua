local o = vim.opt

o.colorcolumn = "120"
o.relativenumber = true
o.scrolloff = 20
-- o.foldmethod = "indent"
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.nrformats:append({'alpha', 'octal'})
