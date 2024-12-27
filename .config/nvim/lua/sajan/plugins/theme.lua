-- return {
--   "cdmill/neomodern.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("neomodern").setup({
--       theme = "roseprime", -- optional configuration here
--       plugin = {
--       }
--     })
--     require("neomodern").load()
--   end,
-- }







return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  opts = {
    transparent_mode = true,
    gruvbox_material_foreground = 'material',
    gruvbox_material_background = 'soft',
    styles = {
      sidebars = "transparent",
      float = "transparent",
    },
  },
  config = function(_, opts)
    if vim.fn.has('termguicolors') == 1 then
      vim.opt.termguicolors = true
    end
    vim.cmd('colorscheme gruvbox-material')
  end
}

--
--
-- return {
--   "dgox16/oldworld.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("oldworld").setup({
--       terminal_colors = true, -- Enable terminal colors
--       styles = {
--         comments = {},        -- Style for comments
--         keywords = {},        -- Style for keywords
--         identifiers = {},     -- Style for identifiers
--         functions = {},       -- Style for functions
--         variables = {},       -- Style for variables
--         booleans = {},        -- Style for booleans
--       },
--       integrations = {
--         alpha = true,
--         cmp = true,
--         flash = true,
--         gitsigns = true,
--         hop = false,
--         indent_blankline = true,
--         lazy = true,
--         lsp = true,
--         markdown = true,
--         mason = true,
--         navic = false,
--         neo_tree = true,
--         neorg = false,
--         noice = true,
--         notify = true,
--         rainbow_delimiters = true,
--         telescope = true,
--         treesitter = true,
--       },
--       highlight_overrides = {},
--     })
--
--     -- Enable the colorscheme
--     vim.cmd("colorscheme oldworld")
--   end,
-- }
--
--
-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup()
--     vim.cmd("colorscheme gruvbox")
--   end
-- }
