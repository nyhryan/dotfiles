return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch  = "master",
        lazy    = false,
        build   = ":TSUpdate",
        event   = { "BufReadPre", "BufNewFile" },
        config  = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                auto_install = false,
                highlight = { enable = true, },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = false,
                        node_decremental = "grm",
                    },
                },
            })
        end
    },
}
