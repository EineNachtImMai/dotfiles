vim.api.nvim_buf_create_user_command(0, "OpenPdf", function()
	local filepath = vim.api.nvim_buf_get_name(0)

	local pdf_path = filepath:gsub("%.typ$", ".pdf")

	vim.system({ "zathura", pdf_path })
end, {})

vim.api.nvim_buf_create_user_command(0, "PasteImg", function()
	local img_path = vim.fn.expand("%:p:h") .. "/images/image-" .. os.date("%Y-%m-%d-%X.png")
	-- print(img_path)

	os.execute("wl-paste -n > " .. img_path)
	os.execute("wl-copy " .. img_path)
end, {})
