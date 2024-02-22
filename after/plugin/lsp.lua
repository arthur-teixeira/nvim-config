local lsp = require('lsp-zero')
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer' },
  handlers = {
    lsp.default_setup,
  },
})

require('lspconfig').rust_analyzer.setup({
  -- Other Settings ...
  procMacro = {
    ignored = {
      leptos_macro = {
        "component",
        "server",
      },
    },
  },
})

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
  })
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

lsp.configure('black', {
  on_attach = function(_, bufnr)
    local opt = { buffer = bufnr, remap = false }
    print("Hello from black")
    vim.keymap.set("n", "<leader>f", function()
      vim.cmd.Black()
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
