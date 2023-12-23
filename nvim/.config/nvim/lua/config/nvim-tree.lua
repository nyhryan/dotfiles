vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-tree keymaps
vim.keymap.set('n', '<leader>to', ':NvimTreeToggle<CR>', {noremap = true, silent = true,})

require('nvim-tree').setup({
    renderer = {
        icons = {
            web_devicons = {
                file = { enable = true, color = true, },
                folder = { enable = false, color = true, },
            },
        },
    },
})
