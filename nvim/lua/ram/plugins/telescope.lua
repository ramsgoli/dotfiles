return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>f", "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>", mode = "n", desc = "FindFile" },
    { "<leader>g", "<CMD>lua require('telescope.builtin').live_grep()<CR>", mode = "n", desc = "LiveGrep" },
    { "gs", "<CMD>lua require('telescope.builtin').grep_string()<CR>", mode = "n", desc = "LiveGrep" },
  },
  opts = {
    defaults = {
      prompt_prefix = ' ',
      selection_caret = '﬌ ',
      mappings = {
        i = {
          ["<C-e>"] = "close",
        },
      },
    },
  }
}
