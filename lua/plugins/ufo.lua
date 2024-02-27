local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" 󰁂 %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end
return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			{ 
				"kevinhwang91/promise-async",
				version = "1.0"
			},
		},
		event = "BufReadPost",
		opts = {
			preview = {
				win_config = {
					border = "single",
					winhighlight = "Normal:Normal",
					winblend = 10,
				},
				mappings = {
					scrollU = "<C-p>",
					scrollD = "<C-n>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
			fold_virt_text_handler = handler,
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
	},
}
