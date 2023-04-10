return {
    "luk400/vim-jukit",
    ft = {"python", "ipynb"},
    keys = {
            {"<leader>jn",':call jukit#convert#notebook_convert("jupyter-notebook")<cr>'},
            {"<leader>jh",':call jukit#splits#output_and_history()<cr>'},
            {"<leader>jj",':call jukit#send#section(0)<cr>'},
            {"<leader>jo",':call jukit#splits#output()<cr>'}
        },
}