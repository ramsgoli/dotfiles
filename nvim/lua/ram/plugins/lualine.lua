return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          path = 1,
          show_filename_only = true
        },
      },
      lualine_x = {
        {
          'filetype',
          icon_only = true
        }
      },
    },
    inactive_sections = {
      lualine_x = {}
    }
  }
}
