vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- go-to-definition
vim.keymap.set("n", "gt", "<Plug>(coc-definition)", {silent = true})

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    
-- Use sd to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- show docs
vim.keymap.set("n", "sd", '<CMD>lua _G.show_docs()<CR>', {silent = true})
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
-- Scroll up and down in documentation window
vim.api.nvim_set_keymap('i', '<C-Up>', 'coc#float#scroll(0,1)', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Down>', 'coc#float#scroll(1,1)', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', 'coc#float#scroll(0,1)', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', 'coc#float#scroll(1,1)', { expr = true, noremap = true, silent = true })

-- "Ctrl+y" to copy current word
vim.api.nvim_set_keymap('n', '<C-y>', 'wbvey', { noremap = true})

-- Insert line above
vim.api.nvim_set_keymap('n', '<C-i>', 'I<CR><Up>', {noremap = true})
-- Append line below
    vim.api.nvim_set_keymap('n', '<C-a>', 'A<CR>', {noremap = true})

-- Better support for indenting in visual! (gv re-select previous visual)
vim.api.nvim_set_keymap('v','<Tab>',">gv", {})
vim.api.nvim_set_keymap('v','<S-Tab>',"<gv", {})

-- tab in normal mode
vim.api.nvim_set_keymap('n', '<TAB>', 'i<Tab><Esc><Right>^', {})
vim.api.nvim_set_keymap('n', '<S-TAB>', 'i<S-Tab><Esc><Right>^', {})
-- indent current line in normal mode
vim.api.nvim_set_keymap('n', '<C-TAB>', 'I<Tab><Esc><Right>^', {})
vim.api.nvim_set_keymap('n', '<C-S-TAB>', 'I<S-Tab><Esc><Right>^', {})

-- enter in normal mode
vim.api.nvim_set_keymap('n', '<Enter>', 'i<Enter><Esc>', {})
-- backspace in normal mode
vim.api.nvim_set_keymap('n', '<BS>', 'i<BS><Esc>', {})

-- select-all
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {})

-- Ctrl+S to trigger spellcheck
function _G.trigger_spellcheck()
    if vim.opt.spell:get() then
        vim.opt.spell = false
    else
        vim.opt.spell = true
    end
end
vim.keymap.set('n', '<C-s>', '<CMD>lua _G.trigger_spellcheck()<CR>', {silent = true, noremap = true})
