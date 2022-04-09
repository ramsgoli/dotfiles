local setup_ok, lsp_signature = pcall(require, 'lsp_signature')
if not setup_ok then
  return
end

lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded"
  }
}
