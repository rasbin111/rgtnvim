require("bufferline").setup({
	options = {
		custom_filter = function(buf_number)
			-- filter out [No Name] buffers
			local buf_name = vim.fn.bufname(buf_number)
			return buf_name ~= "" -- Only display buffers with names
		end,
	}
})
