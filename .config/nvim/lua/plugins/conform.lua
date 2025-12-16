return {
	-- auto-save
	{
		"0x00-ketsu/autosave.nvim",
		event = { "InsertLeave", "TextChanged" },
		config = function()
			require("autosave").setup({
				conditions = {
					exists = true,
					modifiable = true,
					filename_is_not = {},
					filetype_is_not = { "harpoon" },
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- Tree-sitter aware (important for TSX/JSX)
				fast_wrap = {},
			})
		end,
	},
	-- autotag for HTML/JSX/TSX
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- auto-close tag
					enable_rename = true, -- auto-rename closing tag
					enable_close_on_slash = false,
				},
			})
		end,
	},
	-- code formatter (Conform)
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "n",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				java = { "google-java-format" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
		},
	},
}
