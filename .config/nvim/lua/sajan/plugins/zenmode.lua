return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 1,
				width = 100,
				height = 1,
				options = {
					-- Uncomment the settings you want to customize
					-- signcolumn = "no",
					-- number = false,
					-- relativenumber = false,
					-- cursorline = false,
					-- cursorcolumn = false,
					-- foldcolumn = "0",
					-- list = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
					laststatus = 0,
				},
				twilight = { enabled = false },
				gitsigns = { enabled = false },
				tmux = { enabled = true },
				todo = { enabled = false },
				kitty = {
					enabled = false,
					font = "+4",
				},
				disable_animations = {
					neovide_animation_length = 0,
					neovide_cursor_animate_command_line = false,
					neovide_scroll_animation_length = 0,
					neovide_position_animation_length = 0,
					neovide_cursor_animation_length = 0,
					neovide_cursor_vfx_mode = "",
				},
			},
			on_open = function(win)
				-- Custom actions when Zen Mode opens
			end,
			on_close = function()
				-- Custom actions when Zen Mode closes
			end,
		})
		vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true, desc = "Toggle Zen Mode" })
	end,
}
