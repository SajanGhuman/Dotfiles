return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier_local" },
				typescript = { "prettier_local" },
				javascriptreact = { "prettier_local" },
				typescriptreact = { "prettier_local" },
				svelte = { "prettier_local" },
				css = { "prettier_local" },
				html = { "prettier_local" },
				json = { "prettier_local" },
				yaml = { "prettier_local" },
				markdown = { "prettier_local" },
				graphql = { "prettier_local" },
				liquid = { "prettier_local" },
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			formatters = {
				prettier_local = {
					command = "npx",
					args = {
						"prettier",
						"--stdin-filepath",
						"$FILENAME",
						"--plugin",
						"prettier-plugin-tailwindcss",
					},
				},
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>v", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Tailwind Sort + Format file or range" })
	end,
}
