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
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "erlang", "javascript", "html", "make", "haskell", "markdown", "nix" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 },
    {"neoclide/coc.nvim",
        branch = "release"},
	{"nvim-tree/nvim-web-devicons"},
    {"nvim-tree/nvim-tree.lua"},

    -- colorscheme
    --    { "rose-pine/neovim", name = "rose-pine" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

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

