local TerminalToggle = {}

vim.api.nvim_create_user_command("Stuff", function()
	print(vim.fn.input("Stuff: ", ""))
end, {})

return TerminalToggle
