vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {
    'Raimondi/delimitMate'
  }

  use {
    'mattn/vim-gist', requires = { 'mattn/webapi-vim' }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v0.*',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }
end)
