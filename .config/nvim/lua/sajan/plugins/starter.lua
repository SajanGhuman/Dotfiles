return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- NVIM header in ASCII
		dashboard.section.header.val = {
			[[███╗   ██╗██╗   ██╗██╗███╗   ███╗]],
			[[████╗  ██║██║   ██║██║████╗ ████║]],
			[[██╔██╗ ██║██║   ██║██║██╔████╔██║]],
			[[██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
			[[██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
			[[╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
		}
		dashboard.section.header.opts.hl = "AlphaHeader"

		-- Buttons
		dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("c", "  Config", ":e $MYVIMRC | :cd %:p:h <CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		-- Arch Linux footer
		dashboard.section.footer.val = {
			[[ Happy Hacking]],
		}
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Apply config
		alpha.setup(dashboard.config)

		-- Highlights
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#a9b665", bold = true }) -- NVIM in green
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#a9b665", italic = true }) -- Arch logo in green
	end,
}
