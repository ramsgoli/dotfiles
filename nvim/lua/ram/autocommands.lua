-- automatically open Telescope find_files if vim opened with no file
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('VimEnter_Telescope', { clear = true }),
  callback = function()
    if vim.fn.argv(0) == '' then
      require('telescope.builtin').find_files()
    end
  end,
})
