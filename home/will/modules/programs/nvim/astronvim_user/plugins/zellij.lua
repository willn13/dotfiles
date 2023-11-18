-- Integrate Zellij with Neovim
return {
    "Lilja/zellij.nvim",
    cmd = "ZellijNewPane",
    keys ={ 
        { "<leader>zj", ":<cmd>ZellijNewPane<cr>", { desc = "New Zellij Pane" } },
    },
    dependencies = {"jpalardy/vim-slime",},
        config = function()
            require('zellij').setup({})
        end,
}