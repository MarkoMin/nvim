local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
    {'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'godlygeek/tabular'},
    {
    "nvim-treesitter/nvim-treesitter",
    tag = 'v0.9.1',
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "erlang", "javascript", "typescript", "html", "make", "haskell", "markdown", "nix", "graphql"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 },
    {"neoclide/coc.nvim", branch = "release"},
	{"nvim-tree/nvim-web-devicons"},
    {"nvim-tree/nvim-tree.lua",
    tag = 'nvim-tree-v1.1.1'},
    -- block comments
    {"tpope/vim-commentary"},

    -- markdown LSP
    {"yaegassy/coc-marksman"},

    -- colorschemes
    -- { "rose-pine/neovim"},
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- {"morhetz/gruvbox"},
    -- {"nanotech/jellybeans.vim"},
    {"WTFox/jellybeans.nvim"},
    {"dasupradyumna/midnight.nvim"},
    {"Mofiqul/vscode.nvim"},
    -- {"NLKNguyen/papercolor-theme"},
    -- {'lifepillar/vim-solarized8'},

    -- markdown preview
    -- install without yarn or npm
    {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },


  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle <CR>" , {})
  end,
}

})

