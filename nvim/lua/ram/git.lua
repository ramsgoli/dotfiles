vim.api.nvim_set_var('gitblame_date_format', '%b. %d, %y')

require 'git'.setup {
  default_mappings = false
}

vim.api.nvim_set_keymap("n", "<leader>b", "<CMD>GitBlame<CR>", { noremap = true, silent = true })
