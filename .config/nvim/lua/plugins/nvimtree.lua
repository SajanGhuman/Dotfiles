return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- disable netrw
		vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
		-- enable 24-bit colors
		vim.opt.termguicolors = true
		-- setup with centered floating window
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 50,
				side = "left",
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * 0.5
						local window_h = screen_h * 0.8
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = math.floor(center_y),
							col = math.floor(center_x),
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
			},
			renderer = {
				group_empty = false,
			},
			filters = {
				dotfiles = false,
			},
			git = {
				ignore = false,
			},
		})
		-- toggle keymap
		-- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
	end,
}
