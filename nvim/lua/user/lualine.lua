local setup_ok, lualine = pcall(require, 'lualine')
if not setup_ok then
  return
end

lualine.setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
        show_filename_only = true
      },
    },
    lualine_b = {'diff', 'diagnostics'},
  }
}
