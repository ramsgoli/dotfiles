lspconfig = require('lspconfig')
util = require('lspconfig/util')
handlers = require('ram.lsp.handlers')
api = vim.api

-- configure eslint
lspconfig.eslint.setup({
  on_attach = handlers.on_attach
})

lspconfig.terraformls.setup({
  on_attach = function(client, bufnr)
    handlers.lsp_keymaps(bufnr)
  end
})

lspconfig.gopls.setup{
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach = function(client, bufnr)
    handlers.lsp_keymaps(bufnr)
  end
}

-- configure tsserver
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = true, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      handlers.lsp_keymaps(bufnr)
      handlers.lsp_highlight_document(client)
    end
  },
})

local metals_config = require("metals").bare_config()
-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
metals_config.on_attach = handlers.on_attach

metals_config.capabilities = handlers.capabilities
-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

