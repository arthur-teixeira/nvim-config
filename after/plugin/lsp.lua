local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'hls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-b>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.configure('eslint', {
    on_attach = function(_, bufnr)
        local opt = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format()
            vim.cmd.EslintFixAll()
        end, opt)
    end
})

lsp.configure('hls', {
    on_attach = function(_, bufnr)
        vim.cmd.HindentDisable()
        local opt = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>f", function()
            vim.cmd.Hindent()
        end, opt)
    end
})

lsp.on_attach(function(_, bufnr)
    local opt = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opt)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opt)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opt)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opt)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opt)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opt)
    vim.keymap.set('n', '<leader>vca', function() require("cosmic-ui").code_actions() end, opt)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opt)
    vim.keymap.set('n', '<leader>vrn', function() require("cosmic-ui").rename() end, opt)
    vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opt)
end)

lsp.setup()
