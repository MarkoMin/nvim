vim.api.nvim_exec([[
    autocmd FileType erlang setlocal commentstring=%%\ %s
]], true)

