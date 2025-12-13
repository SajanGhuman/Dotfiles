return {
	"folke/noice.nvim", -- Add this line to include the noice plugin
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({})
	end,
}
