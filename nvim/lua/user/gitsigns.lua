local setup_ok, gitsigns = pcall(require, 'gitsigns')
if not setup_ok then
  return
end

gitsigns.setup()
