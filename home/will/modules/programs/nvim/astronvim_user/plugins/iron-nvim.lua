-- Interactive REPL
return {
    "hkupty/iron.nvim",
    cmd = "IronRepl",
    ft = "python",
    config = function()
        require("iron.core").setup({
            config = {
                -- Highlights the last sent block with bold
                highlight_last = "IronLastSent",
                -- Toggling behavior is on by default.
                -- Other options are: `single` and `focus`
                visibility = require("iron.visibility").toggle,
                -- Whether the repl buffer is a "throwaway" buffer or not
                scratch_repl = true,
                -- Automatically closes the repl window on process end
                close_window_on_exit = true,
                repl_definition = {
                 -- forcing a default
                  python = require("iron.fts.python").ipython,
                },
            },
            keymaps = {
                send_motion = "<leader>sc",
                visual_send = "<leader>sc",
                send_file = "<leader>sf",
                send_line = "<leader>sl",
                cr = "<leader>s<cr>",
                interrupt = "<leader>s<leader>",
                exit = "<leader>sq",
                clear = "<leader>cl",
            },
            highlight = {
                italic = true,
            },
            ignore_blank_lines = true,
        })
    end,
}