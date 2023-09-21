local autocmd = vim.api.nvim_create_autocmd

autocmd({ "VimEnter" }, {
	callback = function(ev)
		if ev.file:match("(.*/)(.*)") ~= nil then
			if vim.fn.isdirectory(ev.file) == 1 then
				vim.cmd.cd(ev.file)
				require("nvim-tree.api").tree.open()
				return
			end

			local path, _ = ev.file:match("(.*/)(.*)")
			vim.cmd.cd(path)

			if not vim.fn.filereadable(ev.file) == 1 then
				vim.cmd.e(ev.file)
			end

			-- require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
		end
	end,
})

autocmd({ "BufWinEnter" }, {
	callback = function(_)
		-- vim.cmd("set nofoldenable")
		vim.cmd("normal zR")
	end,
})
