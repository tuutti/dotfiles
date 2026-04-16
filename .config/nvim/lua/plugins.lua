return {
  "Raimondi/delimitMate",
  { "mattn/vim-gist", dependencies = { 'mattn/webapi-vim' } },
  {
    "rose-pine/neovim",
    variant = "dawn",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          ---@usage 'rose-pine' | 'rose-pine-alt'
          theme = 'rose-pine'
        }
      })
    end
  }
}
