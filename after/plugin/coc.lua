vim.api.nvim_exec([[
  augroup SetConfigFileType
    autocmd!
    autocmd BufNewFile,BufRead *.config setfiletype config
  augroup END
]], true)
vim.api.nvim_exec([[
  augroup SetConfigSrcFileType
    autocmd!
    autocmd BufNewFile,BufRead *.config.src setfiletype configsrc
  augroup END
]], true)
vim.api.nvim_exec([[
  augroup SetAppSrcFileType
    autocmd!
    autocmd BufNewFile,BufRead *.app.src setfiletype appsrcfile
  augroup END
]], true)
vim.api.nvim_exec([[
  augroup SetAppFileType
    autocmd!
    autocmd BufNewFile,BufRead *.app setfiletype appfile
  augroup END
]], true)
vim.api.nvim_exec([[
  augroup SetAppupSrcFileType
    autocmd!
    autocmd BufNewFile,BufRead *.appup.src setfiletype appupsrcfile
  augroup END
]], true)
vim.api.nvim_exec([[
  augroup SetAppupFileType
    autocmd!
    autocmd BufNewFile,BufRead *.appup setfiletype appupfile
  augroup END
]], true)
vim.api.nvim_exec([[
  augroup SetRelupFileType
    autocmd!
    autocmd BufNewFile,BufRead *.relup setfiletype relupfile
  augroup END
]], true)
