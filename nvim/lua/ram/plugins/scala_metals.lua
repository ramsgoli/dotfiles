return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
    'saghen/blink.cmp',
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    local lspSettings = require('ram.lsp_settings')

    metals_config.on_attach = lspSettings.on_attach
    metals_config.init_options.statusBarProvider = "off"
    metals_config.capabilities = require('blink.cmp').get_lsp_capabilities()
    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
