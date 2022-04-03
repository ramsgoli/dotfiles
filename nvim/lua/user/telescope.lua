local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return
end


local actions_ok, actions = pcall(require, 'telescope.actions')
if not actions_ok then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = '﬌ ',
    mappings = {
      i = {
        ["<C-e>"] = actions.close,
      },
    },
  },
}
