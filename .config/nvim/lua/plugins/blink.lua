return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {},
			opts = {},
		},
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},

		sources = {
			default = { "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},

		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "lua" },
		signature = { enabled = true },
	},

	config = function(_, opts)
		-- Setup blink with your opts
		require("blink.cmp").setup(opts)

		-- Set highlight for the completion menu

		vim.cmd([[
  hi BlinkCmpMenu guibg=#000000 guifg=#d4be98           " main menu items
  hi BlinkCmpMenuSelection guibg=#3c3836 guifg=#d4be98  " selected item
  hi BlinkCmpMenuBorder guibg=#000000 guifg=#d4be98     " border of the menu
  hi BlinkCmpKind guibg=#000000 guifg=#d4be98           " kind icons/text
  hi BlinkCmpLabel guibg=#000000 guifg=#d4be98          " item label
  hi BlinkCmpLabelDeprecated guibg=#000000 guifg=#7c6f64
  hi BlinkCmpLabelDetail guibg=#000000 guifg=#a89984
  hi BlinkCmpLabelDescription guibg=#000000 guifg=#a89984
  hi BlinkCmpScrollBarThumb guibg=#000000
  hi BlinkCmpScrollBarGutter guibg=#000000
]])
	end,
}
