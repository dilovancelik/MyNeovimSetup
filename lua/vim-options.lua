vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set rnu")
vim.cmd("set nu")
vim.cmd("set clipboard=unnamed")
vim.cmd("set updatetime=1000")
vim.g.mapleader = " "
 
-- setup diagnostics
local diag_augroup = vim.api.nvim_create_augroup("MyLspDiagnostics", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = diag_augroup,
  callback = function(args)
    vim.api.nvim_create_autocmd("CursorHold", {
      group = diag_augroup,
      buffer = args.buf,
      callback = function()
        vim.diagnostic.open_float()
      end,
    })
  end,
})

-- set up LSP signs
for type, icon in pairs({
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

