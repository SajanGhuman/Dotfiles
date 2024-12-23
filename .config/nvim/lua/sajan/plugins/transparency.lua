return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- Important for immediate setup
  config = function()
    require("transparent").setup({
      groups = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
        "NvimTreeRootFolder",
        "NvimTreeFolderName",
        "NvimTreeOpenedFolderName",
        "NvimTreeEmptyFolderName",
        "NvimTreeCursorLine",
      },
      extra_groups = {
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
        "NvimTreeRootFolder",
        "NvimTreeFolderName",
        "NvimTreeOpenedFolderName",
        "NvimTreeEmptyFolderName",
        "NvimTreeCursorLine",
      },
      exclude_groups = {}, -- Specify groups you don't want to clear
    })

    -- Clear specific prefixes for transparency
    require('transparent').clear_prefix('NvimTreeNormal')
    require('transparent').clear_prefix('NvimTreeNormalNC')
    require('transparent').clear_prefix('NvimTreeWinSeparator')     -- Clear prefix for win separator
    require('transparent').clear_prefix('NvimTreeRootFolder')       -- Clear prefix for root folder
    require('transparent').clear_prefix('NvimTreeFolderName')       -- Clear prefix for folder names
    require('transparent').clear_prefix('NvimTreeOpenedFolderName') -- Clear prefix for opened folder names
    require('transparent').clear_prefix('NvimTreeEmptyFolderName')  -- Clear prefix for empty folder names
    require('transparent').clear_prefix('NvimTreeCursorLine')       -- Clear prefix for cursor line


    -- Optional: Set background for floating windows or other specific groups
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
        vim.cmd("hi NvimTreeNormalNC guibg=NONE ctermbg=NONE")
        vim.cmd("hi NvimTreeWinSeparator guibg=NONE ctermbg=NONE")     -- Add this line
        vim.cmd("hi NvimTreeRootFolder guibg=NONE ctermbg=NONE")       -- Ensure root folder is transparent
        vim.cmd("hi NvimTreeFolderName guibg=NONE ctermbg=NONE")       -- Ensure folder names are transparent
        vim.cmd("hi NvimTreeOpenedFolderName guibg=NONE ctermbg=NONE") -- Ensure opened folders are transparent
        vim.cmd("hi NvimTreeEmptyFolderName guibg=NONE ctermbg=NONE")  -- Ensure empty folders are transparent
        vim.cmd("hi NvimTreeCursorLine guibg=NONE ctermbg=NONE")       -- Ensure cursor line is transparent
      end,
    })
  end,
}
