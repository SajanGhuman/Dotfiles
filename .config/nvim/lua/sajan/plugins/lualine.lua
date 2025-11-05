-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local lualine = require("lualine")
--
--     -- Configure lualine
--     lualine.setup({
--       options = {
--         theme = 'gruvbox-material'
--       },
--     })
--   end,
-- }
--
--
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "LunarVim/breadcrumbs.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local lualine = require("lualine")
    local breadcrumbs = require("breadcrumbs")

    -- Define a custom theme based on Gruvbox Material with modified mode colors
    local custom_gruvbox_material = require("lualine.themes.gruvbox-material")

    -- Modify normal and insert mode colors
    custom_gruvbox_material.normal.a.bg = "#a9b665" -- Green for normal mode
    custom_gruvbox_material.insert.a.bg = "#e68183" -- Pink for insert mode

    -- Configure lualine
    lualine.setup({
      options = {
        theme = custom_gruvbox_material,
      },
      sections = {
        lualine_c = {
          { 'filename', path = 1 }, -- Display the file name (path = 1 shows relative path)
          { function() return breadcrumbs.get_breadcrumb() end }, -- Add breadcrumbs
        },
      },
    })
  end,
}

