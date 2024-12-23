return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local oldworld_palette = require("oldworld.palette") -- Import Old World palette

    lualine.setup({
      options = {
        theme = {
          normal = {
            a = { fg = oldworld_palette.fg, bg = oldworld_palette.bg },
            b = { fg = oldworld_palette.fg, bg = oldworld_palette.bg_light },
            c = { fg = oldworld_palette.fg, bg = oldworld_palette.bg_dark },
          },
          insert = { a = { fg = oldworld_palette.bg, bg = oldworld_palette.green } },
          visual = { a = { fg = oldworld_palette.bg, bg = oldworld_palette.blue } },
          replace = { a = { fg = oldworld_palette.bg, bg = oldworld_palette.red } },
          command = { a = { fg = oldworld_palette.bg, bg = oldworld_palette.yellow } },
          inactive = {
            a = { fg = oldworld_palette.fg, bg = oldworld_palette.bg_dark },
            b = { fg = oldworld_palette.fg, bg = oldworld_palette.bg_dark },
            c = { fg = oldworld_palette.fg, bg = oldworld_palette.bg_dark },
          },
        },
        section_separators = { '', '' },  -- No separator before and after sections
        component_separators = { '|', '|' }, -- Simple | separator between components
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end,
}

