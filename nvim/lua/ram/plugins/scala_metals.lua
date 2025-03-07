return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
    'saghen/blink.cmp',
  },
  ft = { "scala", "sbt", "java" },
  keys = {
    { '<leader>mc', '<CMD>lua require("telescope").extensions.metals.commands()<CR>', mode = 'n' },
  },
  opts = function()
    local metals_config = require("metals").bare_config()
    local lspSettings = require('ram.lsp_settings')

    metals_config.on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
      lspSettings.on_attach(client, bufnr)
    end
    metals_config.init_options.statusBarProvider = "off"
    metals_config.capabilities = require('blink.cmp').get_lsp_capabilities()
    metals_config.settings = {
      useGlobalExecutable = true,
      defaultBspToBuildTool = true,
      javaHome = "/usr/local/Cellar/openjdk@8/1.8.0-402/libexec/openjdk.jdk/Contents/Home",
      serverProperties = {
        "-Xmx16G",
        "-XX:MaxMetaspaceSize=4G",
      },
      bloopJvmProperties = {
        "-Xmx16G"
      }
    }
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
