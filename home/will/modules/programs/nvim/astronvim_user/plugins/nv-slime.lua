-- Send to Zellij / Tmux
return {
    "jpalardy/vim-slime",
        config = function()
            vim.g.slime_target = 'zellij'
            vim.g.slime_default_config = {session_id = "current", relative_pane = "right",}
            vim.g.slime_bracketed_paste = 0
            -- vim.g.slime_python_ipython = 1
            -- vim.g.slime_dont_ask_default = 1
        end,
}