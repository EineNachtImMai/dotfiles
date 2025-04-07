local line = {
	lines = "Hello World",
	name = "test",
}

local ns_id = vim.api.nvim_create_namespace("MyPluginNamespace")

-- Function to define highlight groups dynamically
local function set_highlight(group_name, fg, bg)
	vim.cmd(string.format("highlight %s guifg=%s guibg=%s", group_name, fg, bg))
end

-- Function to color characters using virtual text
local function color_chars(bufnr)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	for row, line in ipairs(lines) do
		for col = 0, #line - 1 do
			local char = line:sub(col + 1, col + 1)
			local group_name = "ColorChar" .. row .. "_" .. col

			-- Example: Cycle colors based on position
			local fg_color = string.format("#%02X%02X%02X", (col * 20) % 255, 100, 200)
			local bg_color = "#000000"

			-- Define highlight group dynamically
			set_highlight(group_name, fg_color, bg_color)

			-- Apply virtual text to overlay the character
			vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, col, {
				virt_text = { { char, group_name } },
				virt_text_pos = "overlay", -- Overlay replaces the text visually
			})
		end
	end
end

local test = function()
	local buffer = vim.api.nvim_create_buf(false, true)
	local window = vim.api.nvim_open_win(buffer, true, {
		row = (vim.o.lines / 2) - 5,
		col = (vim.o.columns / 2) - 50,
		width = 100,
		height = 10,
		relative = "editor",
		style = "minimal",
		border = "rounded",
		zindex = 100,
	})
	vim.api.nvim_buf_set_lines(buffer, 0, 2, false, { "Hello World!", "test", "dammit", "wut?" })

	color_chars(0)
end

vim.api.nvim_create_user_command("Test", function()
	test()
end, {})
