return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      sync_install = false, -- to install languages async
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
      }
    }
  end
}
