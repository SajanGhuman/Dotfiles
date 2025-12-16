return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optional: Configure the theme before loading
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_background = "medium" -- Options: 'hard', 'medium', 'soft'
		vim.g.gruvbox_material_transparent_background = 2 -- Enable transparent background
		
		-- Load the colorscheme
		vim.cmd.colorscheme("gruvbox-material")
		
		-- Set black background everywhere
		vim.cmd([[
			highlight Normal guibg=#000000 ctermbg=0
			highlight NormalNC guibg=#000000 ctermbg=0
			highlight NormalFloat guibg=#000000 ctermbg=0
			highlight SignColumn guibg=#000000 ctermbg=0
			highlight EndOfBuffer guibg=#000000 ctermbg=0
			highlight LineNr guibg=#000000 ctermbg=0
			highlight CursorLineNr guibg=#000000 ctermbg=0
			highlight StatusLine guibg=#000000 ctermbg=0
			highlight StatusLineNC guibg=#000000 ctermbg=0
			highlight VertSplit guibg=#000000 ctermbg=0
			highlight WinSeparator guibg=#000000 ctermbg=0
			
			" Float border and background
			highlight FloatBorder guibg=#000000 ctermbg=0
			highlight FloatTitle guibg=#000000 ctermbg=0
			
			" nvim-tree black background
			highlight NvimTreeNormal guibg=#000000 ctermbg=0
			highlight NvimTreeNormalFloat guibg=#000000 ctermbg=0
			highlight NvimTreeNormalNC guibg=#000000 ctermbg=0
			highlight NvimTreeEndOfBuffer guibg=#000000 ctermbg=0
			highlight NvimTreeSignColumn guibg=#000000 ctermbg=0
			highlight NvimTreeWinSeparator guibg=#000000 ctermbg=0
			highlight NvimTreeStatusLine guibg=#000000 ctermbg=0
			highlight NvimTreeStatusLineNC guibg=#000000 ctermbg=0
			highlight NvimTreeCursorLine guibg=#000000 ctermbg=0
			
			" fidget.nvim black background
			highlight FidgetTask guibg=#000000 ctermbg=0
			highlight FidgetTitle guibg=#000000 ctermbg=0
			highlight FidgetNormal guibg=#000000 ctermbg=0
		]])
	end,
}
