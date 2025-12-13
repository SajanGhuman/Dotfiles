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
					prompt_position = "bottom",
					preview_width = 0.55,
					results_width = 0.8,
				},
				width = 0.9,
				height = 0.85,
				preview_cutoff = 80,
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

	config = function(_, opts)
		local telescope = require("telescope")

		-- IMPORTANT: apply opts
		telescope.setup(opts)

		-- load extensions AFTER setup
		telescope.load_extension("fzf")

		-- keymaps
		local keymap = vim.keymap
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live grep" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

		-- grep word under cursor
		keymap.set("n", "<leader>fws", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end)

		keymap.set("n", "<leader>fWs", function()
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end)

		-- TODO comments
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
	end,
}
