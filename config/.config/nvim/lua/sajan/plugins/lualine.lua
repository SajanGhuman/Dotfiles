return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- Configure lualine
    lualine.setup({
      options = {
        theme = 'gruvbox-material'
      },
    })
  end,
}
