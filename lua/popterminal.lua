vim.api.nvim_create_user_command("PopTerminal", function()
	local Popup = require("nui.popup")
	local event = require("nui.utils.autocmd").event

	local popup = Popup({
	  enter = true,
	  focusable = true,
	  border = {
		style = "rounded",
	  },
	  position = "50%",
	  size = {
		width = "80%",
		height = "60%",
	  },
	})

	-- mount/open the component
	popup:mount()

	-- unmount component when cursor leaves buffer
	popup:on(event.BufLeave, function()
	  popup:unmount()
	end)

	-- set content
	vim.cmd('terminal')

	-- close terminal with esc
	popup:map("n", "<esc>", function(bufnr)
	  vim.cmd("bd!")
	end, { noremap = true })
end, {})
