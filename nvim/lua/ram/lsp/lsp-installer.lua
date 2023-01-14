local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local mason = require("mason")
local lspconfig = require("lspconfig")

local servers = { "sumneko_lua", "tsserver", "eslint", "terraformls", "gopls", "bashls" }

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("ram.lsp.handlers").on_attach,
    capabilities = require("ram.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "ram.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  -- add a special case for tsserver, since we want to go through typescript.nvim here
  if server == "tsserver" then
    require("typescript").setup({
      server = opts,
    })
  else
    lspconfig[server].setup(opts)
  end
end
