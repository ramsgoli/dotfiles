local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require('ram.lsp.lsp-installer')
require('ram.lsp.handlers').setup()
