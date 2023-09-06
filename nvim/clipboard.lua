local os_output = vim.fn.system('uname -a')
local wslenv = vim.fn.getenv('WSLENV')

if wslenv then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ["+"] = 'clip.exe',
      ["*"] = 'clip.exe',
    },
    paste =  {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
  }
elseif string.match(os_output, 'Linux') then
  vim.g.clipboard = 'unnamedplus'
else
  print("Running in PowerShell or another environment")
end

