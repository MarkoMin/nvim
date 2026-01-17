local builtin = require('telescope.builtin')
-- Find in all files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fl', ":Telescope resume<cr>", {silent = true})
vim.keymap.set('n', '<leader><leader>', ":Telescope oldfiles<cr>", {silent = true})
