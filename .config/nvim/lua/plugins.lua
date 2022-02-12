return require('packer').startup(function(use)
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v0.*',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    -- Fix mismatch palette between variants
    event = 'ColorScheme',
    config = function()
      require('lualine').setup({
        options = {
          ---@usage 'rose-pine' | 'rose-pine-alt'
          theme = 'rose-pine'
        }
      })
    end
  }
end)
