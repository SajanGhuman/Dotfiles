return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- enable 24-bit colors
		vim.opt.termguicolors = true

		-- setup with minimal options
		require("nvim-tree").setup({
			sort = {
        sorter = "case_sensitive",
      },
			view = {
        width = 30,
        side = "left",
      },
			renderer = {
				group_empty = false,
			},
			filters = {
        dotfiles = false,
      },
      git = {
        ignore = false
      }
		})

		-- transparency
		vim.cmd([[ highlight NvimTreeNormal guibg=NONE ctermbg=NONE ]])
		vim.cmd([[ highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE ]])

		-- toggle keymap
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
	end,
}
