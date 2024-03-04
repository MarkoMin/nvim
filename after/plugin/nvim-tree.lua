require'nvim-tree'.setup {
    view = {
        adaptive_size = true,
        side = 'left'
    },
    git = {
        enable = false
    },
    renderer = {
	    group_empty = true,
	},
}

vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>NvimTreeFocus<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>qt', '<cmd>NvimTreeToggle<CR>', {noremap = true})
