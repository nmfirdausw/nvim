return {
	"stevearc/oil.nvim",
	cmd = { "Oil" },
  	keys = {
    		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  	},
	config = function ()
		require("oil").setup()
	end
}
