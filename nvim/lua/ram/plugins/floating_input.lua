return {
  'liangxianzhe/floating-input.nvim',
  config = function()
    local floating_intput = require('floating-input')
    floating_intput.setup()
    vim.ui.input = function(opts, on_confirm)
      floating_intput.input(opts, on_confirm, { border = 'double' })
    end
  end
}
