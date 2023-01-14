local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return
end


local actions_ok, actions = pcall(require, 'telescope.actions')
if not actions_ok then
  return
end

vim.cmd[[
  command! Buffers execute 'Telescope buffers'
]]

vim.cmd[[
  command! Symbols execute 'Telescope lsp_dynamic_workspace_symbols'
]]

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = '﬌ ',
    mappings = {
      i = {
        ["<C-e>"] = actions.close,
        ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
      },
    },
  },
}
