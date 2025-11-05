return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- Import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- Configure autopairs with Treesitter support and fast wrap
    autopairs.setup({
      check_ts = true,                      -- Enable Treesitter support
      ts_config = {
        lua = { "string" },                 -- Don't add pairs in Lua string nodes
        javascript = { "template_string" }, -- Don't add pairs in JavaScript template_string nodes
        java = false,                       -- Disable Treesitter for Java
      },
      fast_wrap = {},                       -- Enable fast wrap feature
    })

    -- -- Add custom rules for HTML, JSX, TSX, and other filetypes
    -- local Rule = require("nvim-autopairs.rule")
    -- local ts_conds = require("nvim-autopairs.ts-conds")
    --
    -- -- Add custom pairing rules based on filetypes
    -- autopairs.add_rules({
    --   Rule("<", ">", "html"):with_pair(ts_conds.is_not_ts_node({ "string", "comment" })),
    --   Rule("<", ">", "javascriptreact"):with_pair(ts_conds.is_not_ts_node({ "string", "comment" })),
    --   Rule("<", ">", "typescriptreact"):with_pair(ts_conds.is_not_ts_node({ "string", "comment" })),
    --   Rule("<", ">", "javascript"):with_pair(ts_conds.is_not_ts_node({ "string", "comment" })),
    --   Rule("<", ">", "typescript"):with_pair(ts_conds.is_not_ts_node({ "string", "comment" }))
    -- })
    --
    -- Import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- Make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
