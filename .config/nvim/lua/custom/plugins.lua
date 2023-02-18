-- return function(use)
--   use 'ellisonleao/gruvbox.nvim'
--   use 'tidalcycles/vim-tidal'
--   use 'vim-pandoc/vim-pandoc'
--   use 'vim-pandoc/vim-pandoc-syntax'
--   use 'preservim/vim-markdown'
--   use 'supercollider/scvim'
--   use {
--     'nvim-tree/nvim-tree.lua',
--     requires = {
--       'nvim-tree/nvim-web-devicons', -- optional, for file icons
--     },
--   }
-- end

return {

  { -- theme
    'ellisonleao/gruvbox.nvim',
    opts = { contrast = 'hard' },
  },

  -- pandoc and markdown
  'vim-pandoc/vim-pandoc',
  'vim-pandoc/vim-pandoc-syntax',
  'preservim/vim-markdown',

  -- tidalcycles and supercollider
  'tidalcycles/vim-tidal',
  'supercollider/scvim',

  { -- file tree
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
      update_focused_file = {
        enable = true
      },
      modified = {
        enable = true
      }
    }
  },

  { -- lualine
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
    },
  },
}
