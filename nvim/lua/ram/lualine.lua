local setup_ok, lualine = pcall(require, 'lualine')
if not setup_ok then
  return
end

lualine.setup {
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
