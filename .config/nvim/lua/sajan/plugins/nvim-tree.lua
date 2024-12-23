return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        float = {
          enable = false,         -- Enable floating window
          open_win_config = {
            relative = "editor",  -- Position relative to the editor
            width = 60,           -- Width of the floating window
            height = vim.o.lines, -- Full height minus some padding
            row = 0,              -- Adjust this value for vertical positioning (0 for top, 1 for slightly below)
            col = 0,              -- Position from the left
            style = "minimal",    -- No border
          },
        },
        adaptive_size = true,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = false,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- Arrow when folder is closed
              arrow_open = "", -- Arrow when folder is open
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- Set keymap for opening NvimTree with <leader>e
    local keymap = vim.keymap
    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

    -- Set highlights for NvimTree to ensure transparency
    vim.cmd('highlight NvimTreeNormal guibg=NONE guifg=#d4be98')
    vim.cmd('highlight NvimTreeEndOfBuffer guibg=NONE guifg=#252423')
    vim.cmd('highlight NvimTreeVertSplit guibg=NONE guifg=#32302f')
    vim.cmd('highlight NvimTreeCursorLine guibg=NONE')
    -- vim.cmd('highlight NvimTreeSymlink guifg=#d4be98')
    -- vim.cmd('highlight NvimTreeFolderName guifg=#d4be98')
    -- vim.cmd('highlight NvimTreeRootFolder guifg=#d4be98')
    -- vim.cmd('highlight NvimTreeFolderIcon guifg=#d4be98')
    -- vim.cmd('highlight NvimTreeEmptyFolderName guifg=#d4be98')
    -- vim.cmd('highlight NvimTreeOpenedFolderName guifg=#d4be98')
    vim.cmd('highlight NvimTreeExecFile guifg=#d4be98')
    -- vim.cmd('highlight NvimTreeOpenedFile guifg=#d4be98')
    vim.cmd('highlight NvimTreeSpecialFile guifg=#d4be98')
    vim.cmd('highlight NvimTreeImageFile guifg=#d4be98')
    vim.cmd('highlight NvimTreeMarkdownFile guifg=#d4be98')
    vim.cmd('highlight NvimTreeIndentMarker guifg=#d4be98')
    vim.cmd('highlight NvimTreeGitDirty guifg=#d4be98')
    vim.cmd('highlight NvimTreeGitStaged guifg=#d4be98')
    vim.cmd('highlight NvimTreeGitMerge guifg=#d4be98')
    vim.cmd('highlight NvimTreeGitRenamed guifg=#d4be98')
    vim.cmd('highlight NvimTreeGitNew guifg=#d4be98')
    vim.cmd('highlight NvimTreeGitDeleted guifg=#d4be98')
    vim.cmd('highlight NvimTreeLspDiagnosticsError guifg=#d4be98')
    vim.cmd('highlight NvimTreeLspDiagnosticsWarning guifg=#d4be98')
    vim.cmd('highlight NvimTreeLspDiagnosticsInformation guifg=#d4be98')
    vim.cmd('highlight NvimTreeLspDiagnosticsHint guifg=#d4be98')
  end,
}
