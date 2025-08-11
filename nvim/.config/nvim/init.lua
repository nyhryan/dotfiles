-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.  
vim.opt.expandtab=true
vim.opt.shiftwidth=4
vim.opt.softtabstop=4

-- Set <Space> as Leader
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader=" "

-- Print line number
vim.opt.number=true
vim.opt.relativenumber=true

-- Rounded floating window
vim.opt.winborder="rounded"

-- Packages
vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable({ "lua_ls" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client == nil then
            return
        end
        if client:supports_method("textDocument/completion") then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end)
        end
    end,
})

-- Diagnostic settings
vim.diagnostic.config({
    virtual_lines = { current_line = true },
})
