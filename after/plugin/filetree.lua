require('nvim-tree').setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>ff', vim.cmd.NvimTreeFindFile)
