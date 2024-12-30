return {
  -- Other plugins...
  "folke/noice.nvim",  -- Add this line to include the noice plugin
  config = function()
    require("noice").setup({
      -- Configuration options for noice
    })
  end,
}

