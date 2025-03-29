return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        file_ignore_patterns = { "node_modules", ".git" }, -- Ignore node_modules and .git directories
        vimgrep_arguments = {
          'rg', '--no-heading', '--with-filename', '--line-number', '--column',
          '--smart-case' -- Use ripgrep for searching
        },
        preview = false,
      },
    }
    )

    -- Load the fzf-native extension for improved fuzzy searching
    telescope.load_extension("fzf")

    -- Set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fl", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope live_string<cr>", { desc = "Find string under the cursor in cwd" })

    -- Updated key mappings for grep_string and help_tags
    keymap.set('n', '<leader>fws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    keymap.set('n', '<leader>fWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)

    keymap.set('n', '<leader>vh', builtin.help_tags, {})
  end,
}
