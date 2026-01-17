require("vscode").setup({
        -- Enable transparent background
        transparent = false,

        -- Enable italic comments
        italic_comments = true,

        -- Disable nvim-tree background
        disable_nvimtree_bg = true,

        -- Custom color overrides
        color_overrides = {
            vscBack = "#1c1c1c",
        },

        -- Custom highlight overrides
        group_overrides = {
          Cursor = { fg = "#51504f", bg = "#AEAFAD", bold = true },
        },
      })

vim.cmd("colorscheme vscode")
vim.cmd([[
    :hi link NvimTreeImageFile Normal
    :hi link NvimTreeExecFile SpellLocal
    :hi link NvimTreeSymlink NormalFloat
    :hi link NvimTreeSpecialFile Normal
    ]])
