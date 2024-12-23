return {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("hardtime").setup({
      disabled_keys = { "j", "k" },
      max_time = 1000,
      allow_different_key = true,
      hint = true,
    })
  end,
}

