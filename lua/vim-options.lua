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
vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		if vim.lsp.buf.server_ready() then
			vim.diagnostic.open_float()
		end
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

