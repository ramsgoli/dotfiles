local setup_ok, lualine = pcall(require, 'lualine')
if not setup_ok then
  return
end

local function getErrorsText()
  local numErrors = vim.api.nvim_get_var('num_ts_errors')
  if numErrors ~= nil then
    return numErrors .. ' ' .. 'errors'
  end
end

lualine.setup {
  sections = {
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
        show_filename_only = true
      },
    },
    lualine_x = { getErrorsText },
    lualine_y = {
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
