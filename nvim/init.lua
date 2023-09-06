vim.opt.colorcolumn = "120"
vim.opt.relativenumber = true
vim.opt.scrolloff = 40
local autocmd = vim.api.nvim_create_autocmd


local function open_nvim_tree(data)
    local split_result = data.file:match("(.*/)(.*)")

    if split_result ~= nil then
      local directory = vim.fn.isdirectory(data.file) == 1
      if directory then
        vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
        return
      end

      local path, _ = data.file:match("(.*/)(.*)")
      vim.cmd.cd(path)

      local real_file = vim.fn.filereadable(data.file) == 1
      if not real_file then
        vim.cmd.e(data.file)
      end

      require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
    end
end

autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require "custom.clipboard"
