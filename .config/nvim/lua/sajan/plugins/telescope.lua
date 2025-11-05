return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top", -- prompt at the top
					preview_width = 0.55,
					results_width = 0.8,
				},
				width = 0.9,
				height = 0.85,
				preview_cutoff = 120,
			},
			sorting_strategy = "ascending",
			winblend = 0,
			path_display = { "smart" },
			file_ignore_patterns = { "node_modules", ".git" },
			vimgrep_arguments = {
				"rg",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous,
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-q>"] = function(prompt_bufnr)
						local actions = require("telescope.actions")
						actions.send_selected_to_qflist(prompt_bufnr)
						actions.open_qflist()
					end,
				},
			},
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf") -- fzf-native extension

		local keymap = vim.keymap
		local builtin = require("telescope.builtin")

		-- File pickers
		keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

		-- TODO comments
		keymap.set("n", "<leader>fl", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		-- Grep current word
		keymap.set("n", "<leader>fws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		keymap.set("n", "<leader>fWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		-- Help tags
		keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Search help tags" })
	end,
}
