vim.api.nvim_create_user_command(
  'CopyFileName',
  function()
    vim.fn.setreg('*', vim.fn.expand('%:p'))
  end,
  {}
)
