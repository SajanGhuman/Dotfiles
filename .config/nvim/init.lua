require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.theme"),
	require("plugins.lsp"),
	require("plugins.nvimtree"),
	require("plugins.telescope"),
	-- require("plugins.whichkey"),
	require("plugins.lazydev"),
	require("plugins.blink"),
	require("plugins.transparent"),
	require("plugins.conform"),
    require("plugins.colorizer"),
    require("plugins.tabout"),
    require("plugins.harpoon"),
    require("plugins.indent-blackline"),
    require("plugins.trouble"),
    require("plugins.todocomments"),
    require("plugins.yazi")
})
