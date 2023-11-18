return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of imporing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	{ import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
	{ import = "astrocommunity.pack.python", enabled = true },
	{ import = "astrocommunity.pack.lua", enabled = true },
	{ import = "astrocommunity.pack.nix", enabled = true },
	{ import = "astrocommunity.pack.bash", enabled = true },
	{ import = "astrocommunity.pack.markdown", enabled = true },
	{ import = "astrocommunity.pack.typescript", enabled = true },
	{ import = "astrocommunity.pack.tailwindcss", enabled = true },
	{ import = "astrocommunity.pack.full-dadbod", enabled = true },
	{ import = "astrocommunity.comment.mini-comment", enabled = true },
	{ import = "astrocommunity.code-runner.sniprun", enabled = true },
	{ import = "astrocommunity.note-taking.neorg", enabled = true },
	{ import = "astrocommunity.fuzzy-finder.telescope-zoxide", enabled = true },
	{ import = "astrocommunity.utility.telescope-live-grep-args.nvim", enabled = true },





}
