vim.api.nvim_buf_create_user_command(0, "Compile", function()
    vim.cmd(":!pdflatex %")
end, {})
